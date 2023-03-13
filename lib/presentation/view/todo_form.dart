import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../domain/model/todo.dart';
import '../viewmodel/todoform/todo_form.dart';

class TodoFormPage extends ConsumerStatefulWidget {
  final Todo? todo;
  final bool showSave;

  const TodoFormPage({
    Key? key,
    this.todo,
    this.showSave = true,
  }) : super(key: key);

  @override
  ConsumerState<TodoFormPage> createState() => _TodoFormPageState();
}

class _TodoFormPageState extends ConsumerState<TodoFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _dueDateFormFocusNode = _DisabledFocusNode();
  TextEditingController? _dueDateTextFieldController;
  TodoFormViewModel? _viewModel;
  Timer? _debounce;

  _TodoFormPageState();

  @override
  void initState() {
    super.initState();

    init();
  }

  void init() {
    _viewModel = ref.read(todoFormViewModelProvider(widget.todo).notifier);
    _dueDateTextFieldController = TextEditingController(
      text: _viewModel!.initialDueDateString(),
    );
  }

  @override
  void dispose() {
    _dueDateFormFocusNode.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant TodoFormPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.todo != widget.todo) {
      init();
      _formKey.currentState?.reset();
    }
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_viewModel!.appBarTitle()),
        actions: [
          if (_viewModel!.shouldShowDeleteTodoIcon())
            _buildDeleteTodoIconWidget(),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 200,
            maxWidth: 800,
          ),
          child: _buildBodyWidget(),
        ),
      ),
    );
  }

  bool _save(BuildContext context) {
    final currentState = _formKey.currentState;
    if (currentState != null && currentState.validate()) {
      _viewModel!.createOrUpdateTodo();
      return true;
    }
    return false;
  }

  Widget _buildBodyWidget() {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 24, right: 16, bottom: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildFormWidget(),
          if (widget.showSave) _buildSaveButtonWidget(),
        ],
      ),
    );
  }

  Widget _buildSaveButtonWidget() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          final valid = _save(context);
          if (valid) {
            Navigator.pop(context);
          }
        },
        child: const Text('Save'),
      ),
    );
  }

  Widget _buildFormWidget() {
    return Form(
      key: _formKey,
      onChanged: () {
        if (!widget.showSave) {
          _debounce?.cancel();
          _debounce = Timer(const Duration(milliseconds: 500), () {
            _save(context);
          });
        }
      },
      onWillPop: () async => _save(context),
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          _buildTitleFormWidget(),
          const SizedBox(height: 16),
          _buildDescriptionFormWidget(),
          const SizedBox(height: 16),
          _buildDueDateFormWidget()
        ],
      ),
    );
  }

  Widget _buildTitleFormWidget() {
    return TextFormField(
      initialValue: _viewModel!.initialTitleValue(),
      maxLength: 20,
      onChanged: (value) => _viewModel!.setTitle(value),
      validator: (_) => _viewModel!.validateTitle(),
      decoration: const InputDecoration(
        icon: Icon(Icons.edit),
        labelText: 'Title',
        helperText: 'Required',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildDescriptionFormWidget() {
    return TextFormField(
      initialValue: _viewModel!.initialDescriptionValue(),
      maxLength: 150,
      onChanged: (value) => _viewModel!.setDescription(value),
      validator: (_) => _viewModel!.validateDescription(),
      decoration: const InputDecoration(
        icon: Icon(Icons.view_headline),
        labelText: 'Description',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildDueDateFormWidget() {
    return TextFormField(
      focusNode: _dueDateFormFocusNode,
      controller: _dueDateTextFieldController,
      maxLength: 50,
      onTap: () => _showDatePicker(context),
      onChanged: (value) => _viewModel!.setTitle(value),
      validator: (_) => _viewModel!.validateDescription(),
      decoration: const InputDecoration(
        icon: Icon(Icons.calendar_today_rounded),
        labelText: 'DueDate',
        helperText: 'Required',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildDeleteTodoIconWidget() {
    return IconButton(
      tooltip: 'Delete Todo',
      onPressed: () => _showConfirmDeleteTodoDialog(),
      icon: const Icon(Icons.delete),
    );
  }

  Future<DateTime?> _showDatePicker(final BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: _viewModel!.initialDueDateValue(),
      firstDate: _viewModel!.datePickerFirstDate(),
      lastDate: _viewModel!.datePickerLastDate(),
    );
    if (selectedDate != null) {
      _dueDateTextFieldController!.text =
          DateFormat('yyyy/MM/dd').format(selectedDate);
      _viewModel!.setDueDate(selectedDate);
    }

    return null;
  }

  _showConfirmDeleteTodoDialog() async {
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
      _viewModel!.deleteTodo();
      Navigator.pop(context);
    }
  }
}

class _DisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
