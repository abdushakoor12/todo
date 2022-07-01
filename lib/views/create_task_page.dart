import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/controllers/task_controller.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/utils/constants.dart';
import 'package:todo/views/all_tasks_page.dart';
import 'package:todo/widgets/create_task/custom_text_field.dart';
import '../widgets/create_task/create_task_header.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({Key? key}) : super(key: key);

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TaskController _taskController = TaskController();
  TimeOfDay _selectedTime = TimeOfDay.now();
  DateTime _selectedDate = DateTime.now();
  int _selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CreateTaskHeader(
                onSaved: () {
                  _validateTextTitleDescription();
                },
              ),
              kVerticalSpace(30),
              CustomTextField(
                controller: _titleController,
                label: ('Task title'),
                hintText: 'Task title',
              ),
              Row(
                children: [
                  Flexible(
                    child: CustomTextField(
                      readOnly: true,
                      label: ('Date'),
                      hintText: DateFormat.yMd().format(_selectedDate),
                      onTap: () {
                        _chooseDate();
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: CustomTextField(
                      readOnly: true,
                      label: ('Time'),
                      hintText: _formTimeOfDay(_selectedTime),
                      onTap: () {
                        _chooseTime();
                      },
                    ),
                  ),
                ],
              ),
              CustomTextField(
                controller: _descriptionController,
                label: ('Description'),
                hintText: 'Description ...',
              ),
              Text('Color', style: kTextStyleBoldBlack(20)),
              _colorsPallet(),
            ],
          ),
        ),
      ),
    );
  }

  _validateTextTitleDescription() {
    if (_titleController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty) {
      _createTask();
      Get.snackbar(
        'Task Saved',
        'Task successfully saved',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
      );
      Get.to(
        () => AllTasksPage(),
        transition: Transition.zoom,
        duration: const Duration(milliseconds: 500),
      );
    } else {
      Get.snackbar(
        'Empty field',
        'Task title and description can\'t be empty',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
    }
  }

  _createTask() async {
    final TaskModel newTask = TaskModel(
      title: _titleController.text.trim(),
      description: _descriptionController.text.trim(),
      isDone: 0,
      date: DateFormat.yMd().format(_selectedDate),
      time: _formTimeOfDay(_selectedTime),
      color: _selectedColor,
    );
    await _taskController.addTask(newTask);
  }

  String _formTimeOfDay(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    final date = DateTime(
      now.year,
      now.month,
      now.day,
      timeOfDay.hour,
      timeOfDay.minute,
    );
    final format = DateFormat.jm();
    return format.format(date);
  }

  _chooseTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  _chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2050),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Widget _colorsPallet() {
    return SizedBox(
      height: 40,
      width: Get.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: colors.length,
        itemBuilder: (ctx, index) {
          final color = colors[index];
          return InkWell(
            onTap: () {
              setState(() {
                _selectedColor = index;
              });
            },
            borderRadius: BorderRadius.circular(40),
            child: Container(
              height: 40,
              width: 40,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  width: 1,
                  color: color.withOpacity(0.2),
                ),
              ),
              child: _selectedColor == index
                  ? const Icon(
                      Icons.done,
                      color: Colors.white,
                      size: 16,
                    )
                  : null,
            ),
          );
        },
      ),
    );
  }
}
