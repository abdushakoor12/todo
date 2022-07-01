import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/utils/constants.dart';
import 'package:todo/widgets/custom_button.dart';
import 'package:todo/widgets/task_detail/task_detail_header.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final task = Get.arguments['task'] as TaskModel;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TaskDetailHeader(),
              kVerticalSpace(25),
              Text(
                task.title.toString(),
                style: kTextStyleBlack(24),
              ),
              kVerticalSpace(25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _customRow(task.date.toString(), Icons.calendar_month_sharp),
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: colors[task.color as int].withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        width: 1,
                        color: colors[task.color as int],
                      ),
                    ),
                    child: const SizedBox(
                      width: 20,
                      height: 20,
                    ),
                  ),
                  _customRow(task.time.toString(), Icons.access_time_rounded),
                ],
              ),
              kVerticalSpace(25),
              Text(
                'Description',
                style: kTextStyleBoldBlack(24),
              ),
              Text(
                task.description.toString(),
                style: kTextStyleBlack(18),
              ),
              kVerticalSpace(50),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      label: 'Done',
                      color: Colors.green.withOpacity(0.3),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomButton(
                      label: 'Delete',
                      color: Colors.red.withOpacity(0.3),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _customRow(String label, IconData icon) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 10),
        Text(label, style: kTextStyleBlack(18)),
      ],
    );
  }
}
