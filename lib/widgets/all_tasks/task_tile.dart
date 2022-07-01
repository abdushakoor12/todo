import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/models/task_model.dart';
import '../../utils/constants.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({Key? key, required this.task}) : super(key: key);

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: _customContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      task.title.toString(),
                      style: kTextStyleBoldBlack(20),
                      softWrap: true,
                    ),
                    Text(task.time.toString(), style: kTextStyleBoldBlack(20)),
                  ],
                ),
                Text(
                  task.description.toString(),
                  style: kTextStyleBoldGrey(16),
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 2),
        _customContainer(
          child: Center(
            child: RotatedBox(
              quarterTurns: 3,
              child: Text(
                task.isDone == 0 ? 'Progress' : 'Done',
                style: kTextStyleBoldBlack(20),
              ),
            ),
          ),
          size: 0.15,
        ),
      ],
    );
  }

  Widget _customContainer({required Widget child, double? size}) {
    return Container(
      height: 160,
      width: size == null ? Get.width : Get.width * size,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: colors[task.color as int].withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}
