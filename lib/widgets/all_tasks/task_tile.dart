import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';

class TaskBodyView extends StatelessWidget {
  const TaskBodyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Progress', style: kTextStyleBoldBlack(20)),
        const Divider(),
        Container(
          height: 160,
          width: Get.width,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: Colors.amber.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16),
          ),
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
              Text('Group discussion for new product right now',
                  style: kTextStyleBoldGrey(16), maxLines: 2),
            ],
          ),
        ),
      ],
    );
  }
}
