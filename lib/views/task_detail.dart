import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/task_controller.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/utils/constants.dart';
import 'package:todo/widgets/custom_button.dart';
import 'package:todo/widgets/task_detail/task_detail_header.dart';

class TaskDetail extends StatelessWidget {
  TaskDetail({Key? key}) : super(key: key);
  final TaskController _taskController = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    final task = Get.arguments['task'] as TaskModel;
    final Color color = colors[task.color as int];

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
                  _customRow(
                    color: color,
                    label: task.date.toString(),
                    icon: Icons.calendar_month_sharp,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        width: 1,
                        color: color,
                      ),
                    ),
                    child: const SizedBox(
                      width: 20,
                      height: 20,
                    ),
                  ),
                  _customRow(
                    color: color,
                    label: task.time.toString(),
                    icon: Icons.access_time_rounded,
                  ),
                ],
              ),
              kVerticalSpace(25),
              _customRow(
                  color: color,
                  label: 'Status: ${task.status}',
                  icon: Icons.incomplete_circle),
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
                      color: task.isDone == 1
                          ? Colors.grey.withOpacity(0.3)
                          : Colors.green.withOpacity(0.3),
                      onTap: task.isDone == 1
                          ? null
                          : () {
                              _taskController.updateTaskAsDone(task.id as int);
                            },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomButton(
                      label: 'Delete',
                      color: Colors.red.withOpacity(0.3),
                      onTap: () {
                        _taskController.delete(task);
                        Get.back();
                      },
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

  _customRow(
      {required String label, required IconData icon, required Color color}) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
        ),
        const SizedBox(width: 10),
        Text(label, style: kTextStyleBlack(18)),
      ],
    );
  }
}
