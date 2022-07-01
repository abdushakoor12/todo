import 'package:flutter/material.dart';
import 'package:todo/utils/constants.dart';
import 'package:todo/widgets/custom_button.dart';
import 'package:todo/widgets/rounded_container.dart';
import 'package:todo/widgets/task_detail/task_detail_header.dart';

class TaskDetail extends StatelessWidget {
  TaskDetail({Key? key, required this.index}) : super(key: key);

  final int index;
  final List<Color> colors = [
    Colors.purple,
    Colors.teal,
    Colors.amber,
    Colors.green,
    Colors.blue,
    Colors.blueGrey,
    Colors.pink
  ];

  @override
  Widget build(BuildContext context) {
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
                'Title: Redesign Splash Screen',
                style: kTextStyleBlack(24),
              ),
              kVerticalSpace(25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _customRow('26/07/2022', Icons.calendar_month_sharp),
                  RoundedContainer(
                    color: colors[index],
                    child: const SizedBox(
                      width: 20,
                      height: 20,
                    ),
                  ),
                  _customRow('10:30PM', Icons.access_time_rounded),
                ],
              ),
              kVerticalSpace(25),
              Text(
                'Description',
                style: kTextStyleBoldBlack(24),
              ),
              Text(
                'You need to make a splash screen for the application.'
                ' Style: minimalism. Use one primary color and one accent color.'
                ' You ca use illustrations. 3D animations and other things to'
                ' attract attention Splash Screen',
                style: kTextStyleBlack(18),
              ),
              kVerticalSpace(50),
              Row(
                children: const [
                  Expanded(child: CustomButton(label: 'Done')),
                  SizedBox(width: 10),
                  Expanded(child: CustomButton(label: 'In Progress')),
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
