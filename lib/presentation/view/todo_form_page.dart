import 'package:clean_architecture_todo_app/domain/model/todo.dart';
import 'package:clean_architecture_todo_app/presentation/viewmodel/todoform/todo_form_viewmodel.dart';
import 'package:dain/dain.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoFormPage extends StatefulWidget {
  final Todo? _todo;

  const TodoFormPage(this._todo);

  @override
  State<StatefulWidget> createState() => _TodoFormPageState(_todo);
}

class _TodoFormPageState extends State<TodoFormPage> {
  final _viewModel = Dain.inject<TodoFormViewModel>();
  final _formKey = GlobalKey<FormState>();
  final _dueDateFormFocusNode = _DisabledFocusNode();
  late TextEditingController _dueDateTextFieldController;

  _TodoFormPageState(final Todo? todo) {
    _viewModel.initTodo(todo);
    _dueDateTextFieldController = TextEditingController(
      text: DateFormat('yyyy/MM/dd').format(_viewModel.initialDueDateValue()),
    );
  }

  @override
  void dispose() {
    _dueDateFormFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_viewModel.appBarTitle()),
      ),
      body: _buildBodyWidget(),
    );
  }

  Widget _buildBodyWidget() {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 24, right: 16, bottom: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildFormWidget(),
          _buildSaveButtonWidget(),
        ],
      ),
    );
  }

  Widget _buildSaveButtonWidget() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          final currentState = _formKey.currentState;
          if (currentState != null && currentState.validate()) {
            _viewModel.createOrUpdateTodo();
            Navigator.of(context).pop();
          }
        },
        child: const Text('Save'),
      ),
    );
  }

  Widget _buildFormWidget() {
    return Form(
      key: _formKey,
      child: Container(
        child: Column(
          children: [
            _buildTitleFormWidget(),
            const SizedBox(height: 16),
            _buildDescriptionFormWidget(),
            const SizedBox(height: 16),
            _buildDueDateFormWidget()
          ],
        ),
      ),
    );
  }

  Widget _buildTitleFormWidget() {
    return TextFormField(
      initialValue: _viewModel.initialTitleValue(),
      maxLength: 20,
      onChanged: (value) => _viewModel.setTitle(value),
      validator: (_) => _viewModel.validateTitle(),
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
      initialValue: _viewModel.initialDescriptionValue(),
      maxLength: 150,
      onChanged: (value) => _viewModel.setDescription(value),
      validator: (_) => _viewModel.validateDescription(),
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
      onChanged: (value) => _viewModel.setTitle(value),
      validator: (_) => _viewModel.validateDescription(),
      decoration: const InputDecoration(
        icon: Icon(Icons.calendar_today_rounded),
        labelText: 'DueDate',
        helperText: 'Required',
        border: OutlineInputBorder(),
      ),
    );
  }

  Future<DateTime?> _showDatePicker(final BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: _viewModel.initialDueDateValue(),
      firstDate: _viewModel.datePickerFirstDate(),
      lastDate: _viewModel.datePickerLastDate(),
    );
    if (selectedDate != null) {
      _dueDateTextFieldController.text = DateFormat('yyyy/MM/dd').format(selectedDate);
      _viewModel.setDueDate(selectedDate);
    }
  }
}

class _DisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
