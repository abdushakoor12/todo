import 'package:flutter/material.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/utils/constants.dart';

class TodayTaskTile extends StatelessWidget {
  const TodayTaskTile({Key? key, required this.task}) : super(key: key);

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 230,
        height: 200,
        margin: const EdgeInsets.only(left: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: colors[task.color as int].withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(task.title.toString(), style: kTextStyleBoldWhite(20.0)),
            Text(task.description.toString(),
                style: kTextStyleBoldBlack(16), maxLines: 2),
            Text(task.time.toString(), style: kTextStyleBoldWhite(16)),
            Text(
              task.isDone == 0 ? 'Progress' : 'Done',
              style: kTextStyleBoldWhite(20),
            ),
          ],
        ),
      ),
    );
  }
}
