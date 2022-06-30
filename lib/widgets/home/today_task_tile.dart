import 'package:flutter/material.dart';
import 'package:todo/utils/constants.dart';

class TodayTaskView extends StatelessWidget {
  const TodayTaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 200,
      margin: const EdgeInsets.only(left: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Team Meeting', style: kTextStyleBoldWhite(20.0)),
          Text('Group discussion for new product right now',
              style: kTextStyleBoldBlack(16), maxLines: 2),
          Text('10:00 AM', style: kTextStyleBoldWhite(16)),
          Text('Progress', style: kTextStyleBoldWhite(20)),
        ],
      ),
    );
  }
}
