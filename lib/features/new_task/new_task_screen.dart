import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/app_router.dart';
import 'package:todo_list/data/model/new_task/new_task.dart';
import 'package:todo_list/data/model/project/project.dart';
import 'package:todo_list/dependency_injector/injector.dart';
import 'package:todo_list/features/common/consts/spacing.dart';
import 'package:todo_list/features/common/extensions/build_context.dart';
import 'package:todo_list/features/common/theme/colors.dart';
import 'package:todo_list/features/tasks/cubit/tasks_cubit/tasks_cubit.dart';
import 'package:todo_list/features/widgets/custom_text_form_field.dart';
import 'package:todo_list/features/widgets/priority_selector.dart';
import 'package:todo_list/features/widgets/project_selector.dart';

@RoutePage()
class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  NewTaskBody _newTaskBody = const NewTaskBody(content: '');
  Project? selectedProject;
  DateTime? _selectedDueDate;
  TimeOfDay? _selectedDueTime;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bottomPadding = context.bottomPadding;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.addNewTask),
      ),
      body: BlocConsumer<TasksCubit, TasksState>(
          listener: (context, state) {
            state.maybeWhen(
              error: (_, __, ___) => ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(l10n.anErrorHappened))),
              data: (_) {
                inject<AppRouter>().maybePop();
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(l10n.taskCreated)));
              },
              orElse: () => null,
            );
          },
          listenWhen: (_, current) => current.maybeWhen(
                orElse: () => false,
                error: (_, __, ___) => true,
                data: (tasks) => true,
              ),
          builder: (context, state) {
            final isSaving = state.maybeWhen(
              orElse: () => false,
              loading: () => true,
            );

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          CustomTextFormField(
                            labelText: l10n.newTaskTitle,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return l10n.titleError;
                              }
                              return null;
                            },
                            onSaved: (value) => _newTaskBody =
                                _newTaskBody.copyWith(content: value!),
                          ),
                          const SizedBox(height: Spacing.s4),
                          CustomTextFormField(
                            labelText: l10n.description,
                            maxLines: 5,
                            onSaved: (value) => _newTaskBody =
                                _newTaskBody.copyWith(description: value),
                          ),
                          const SizedBox(height: Spacing.s4),
                          Row(
                            children: [
                              Expanded(
                                child: Center(
                                  child: ProjectSelector(
                                    onChanged: (project) {
                                      selectedProject = project;
                                    },
                                  ),
                                ),
                              ),
                              ColoredBox(
                                color: ColorPalettes.neutral[300]!,
                                child: const SizedBox(
                                  width: Spacing.s1,
                                  height: Spacing.s5,
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: PrioritySelector(
                                    onChanged: (priority) {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: Spacing.s4),
                          Row(
                            children: [
                              Expanded(
                                child: ListTile(
                                  title: Text(_selectedDueDate == null
                                      ? l10n.date
                                      : '${_selectedDueDate!.toLocal()}'
                                          .split(' ')[0]),
                                  trailing: const Icon(Icons.calendar_today),
                                  onTap: _pickDueDate,
                                ),
                              ),
                              ColoredBox(
                                color: ColorPalettes.neutral[300]!,
                                child: const SizedBox(
                                  width: Spacing.s1,
                                  height: Spacing.s5,
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: Text(_selectedDueTime == null
                                      ? l10n.time
                                      : _selectedDueTime!.format(context)),
                                  trailing: const Icon(Icons.access_time),
                                  onTap: _pickDueTime,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: Spacing.s5),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: isSaving ? null : _submitForm,
                      child: isSaving
                          ? CircularProgressIndicator(color: ColorPalettes.pink)
                          : Text(l10n.done),
                    ),
                    SizedBox(height: bottomPadding),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Future<void> _pickDueTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        _selectedDueTime = pickedTime;
      });
      if (_selectedDueDate != null) {
        _setDueDatetime();
      }
    }
  }

  void _setDueDatetime() {
    final DateTime dueDateTime = DateTime(
      _selectedDueDate!.year,
      _selectedDueDate!.month,
      _selectedDueDate!.day,
      _selectedDueTime!.hour,
      _selectedDueTime!.minute,
    );
    _newTaskBody =
        _newTaskBody.copyWith(dueDatetime: dueDateTime.toIso8601String());
  }

  void _pickDueDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDueDate) {
      setState(() {
        _selectedDueDate = pickedDate;
        _newTaskBody =
            _newTaskBody.copyWith(dueDate: _selectedDueDate!.toIso8601String());
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      inject<TasksCubit>().createTask(_newTaskBody);
    }
  }
}
