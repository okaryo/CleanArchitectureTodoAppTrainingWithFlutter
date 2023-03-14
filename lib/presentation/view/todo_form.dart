import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/model/todo.dart';
import '../utils/constants.dart';
import '../viewmodel/todoform/todo_form.dart';
import '../widgets/actions.dart';
import '../widgets/article.dart';
import '../widgets/forms.dart';

class TodoFormPage extends ConsumerStatefulWidget {
  const TodoFormPage({
    Key? key,
    this.todo,
    this.showSave = true,
  }) : super(key: key);

  final Todo? todo;
  final bool showSave;

  @override
  ConsumerState<TodoFormPage> createState() => _TodoFormPageState();
}

class _TodoFormPageState extends ConsumerState<TodoFormPage> {
  late TodoFormViewModel viewModel;
  final _formKey = GlobalKey<FormState>();
  Timer? _debounce;

  @override
  void initState() {
    viewModel = ref.read(todoFormViewModelProvider(widget.todo).notifier);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant TodoFormPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.todo != widget.todo) {
      _formKey.currentState?.reset();
      viewModel = ref.watch(todoFormViewModelProvider(widget.todo).notifier);
    }
  }

  @override
  Widget build(final BuildContext context) {
    final data = ref.watch(todoFormViewModelProvider(widget.todo));
    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.isNew ? 'Add TODO' : 'Edit TODO'),
        actions: [
          if (viewModel.canDelete()) ...[
            IconButton(
              tooltip: 'Delete Todo',
              onPressed: () async {
                final nav = Navigator.of(context);
                final bool result = await showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      content: const Text('Delete TODO?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: const Text('CANCEL'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: const Text('DELETE'),
                        ),
                      ],
                    );
                  },
                );
                if (result) {
                  await viewModel.deleteTodo();
                  nav.pop();
                }
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ],
      ),
      body: Center(
        child: ArticleWidget(
          child: Form(
            key: _formKey,
            onChanged: () {
              if (!widget.showSave) {
                _debounce?.cancel();
                _debounce = Timer(const Duration(milliseconds: 500), () {
                  _save(context);
                });
              }
            },
            onWillPop: () async {
              final modified = viewModel.isEdited;
              if (modified) {
                return confirm(
                  context,
                  title: 'Discard changes?',
                  content: 'Are you sure you want to discard your changes?',
                );
              }
              return true;
            },
            autovalidateMode: AutovalidateMode.always,
            child: Container(
              padding: const EdgeInsets.only(left: 16, top: 24, right: 16, bottom: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        StringFormField(
                          label: 'Title',
                          value: data.title,
                          onChanged: viewModel.setTitle,
                          builder: (context, controller) {
                            return TextFormField(
                              controller: controller,
                              maxLength: 150,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter a title.';
                                } else if (value.length > 20) {
                                  return 'Limit the title to 20 characters.';
                                } else {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                icon: Icon(Icons.title),
                                labelText: 'Title',
                                border: OutlineInputBorder(),
                              ),
                            );
                          },
                        ),
                        StringFormField(
                          label: 'Description',
                          value: data.description,
                          onChanged: viewModel.setDescription,
                          builder: (context, controller) {
                            return TextFormField(
                              controller: controller,
                              maxLength: 150,
                              validator: (value) {
                                if (value != null && value.length > 100) {
                                  return 'Limit the description to 100 characters.';
                                } else {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                icon: Icon(Icons.view_headline),
                                labelText: 'Description',
                                border: OutlineInputBorder(),
                              ),
                            );
                          },
                        ),
                        StringFormField(
                          label: 'Due Date',
                          value: dateFormat.format(data.dueDate),
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              final date = DateTime.tryParse(value);
                              if (date != null) viewModel.setDueDate(date);
                            }
                          },
                          builder: (context, controller) {
                            return TextFormField(
                              focusNode: _DisabledFocusNode(),
                              controller: controller,
                              maxLength: 50,
                              onTap: () async {
                                final selectedDate = await showDatePicker(
                                  context: context,
                                  initialDate: data.dueDate,
                                  firstDate: data.dueDate.pickerStartDate,
                                  lastDate: data.dueDate.pickerEndDate,
                                );
                                if (selectedDate != null) {
                                  viewModel.setDueDate(selectedDate);
                                  controller.text = dateFormat.format(selectedDate);
                                }
                              },
                              validator: (value) {
                                if (viewModel.isNew && data.dueDate.isBefore(DateTime.now())) {
                                  return "DueDate must be after today's date.";
                                } else {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                icon: Icon(Icons.calendar_today_rounded),
                                labelText: 'DueDate',
                                helperText: 'Required',
                                border: OutlineInputBorder(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  if (widget.showSave) ...[
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          final nav = Navigator.of(context);
                          final valid = await _save(context);
                          if (valid) nav.pop();
                        },
                        child: const Text('Save'),
                      ),
                    )
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _save(BuildContext context) async {
    final currentState = _formKey.currentState;
    if (currentState != null && currentState.validate()) {
      await viewModel.createOrUpdateTodo();
      return true;
    }
    return false;
  }
}

class _DisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
