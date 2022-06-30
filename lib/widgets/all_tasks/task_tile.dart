import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({Key? key, required this.color}) : super(key: key);

  final Color color;

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
                      'Team Meeting',
                      style: kTextStyleBoldBlack(20),
                      softWrap: true,
                    ),
                    Text('12:00 PM', style: kTextStyleBoldBlack(20)),
                  ],
                ),
                Text(
                  'Group discussion for new product right now Group discussion for new product right now',
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
                'Progress',
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
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}
