import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/utils/constants.dart';

class TaskDetailHeader extends StatelessWidget {
  const TaskDetailHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _customCircleContainer(
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back, size: 28),
          ),
        ),
        Text(
          'Task Detail',
          style: kTextStyleBoldBlack(24),
        ),
        _customCircleContainer(
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit, size: 24),
          ),
        )
      ],
    );
  }

  _customCircleContainer(Widget child) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(0.2),
        borderRadius: BorderRadius.circular(25),
      ),
      child: child,
    );
  }
}
