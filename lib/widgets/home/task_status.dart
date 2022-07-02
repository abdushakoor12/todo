import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class TaskStatusContainer extends StatelessWidget {
  const TaskStatusContainer(
      {Key? key,
      required this.label,
      required this.iconData,
      required this.color,
      this.onTap})
      : super(key: key);

  final String label;
  final IconData iconData;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(60),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(60),
                border: Border.all(
                  color: color,
                  width: 2,
                ),
              ),
              child: Icon(iconData, color: color, size: 30),
            ),
          ),
          kVerticalSpace(10),
          Text(label, style: kTextStyleBoldBlack(18))
        ],
      ),
    );
  }
}
