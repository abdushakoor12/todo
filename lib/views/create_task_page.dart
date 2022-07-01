import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/utils/constants.dart';
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
  TimeOfDay _selectedTime = TimeOfDay.now();
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const CreateTaskHeader(),
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
            ],
          ),
        ),
      ),
    );
  }

  _validateTextTitleDescription() {
    if (_titleController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty) {
      //save it to data base
    } else {
      //show dialog
    }
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
}
