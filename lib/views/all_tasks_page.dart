import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:todo/utils/constants.dart';
import 'package:todo/widgets/all_tasks/all_task_header.dart';
import 'package:todo/widgets/custom_button.dart';

class AllTasks extends StatelessWidget {
  AllTasks({Key? key}) : super(key: key);
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const AllTaskHeader(),
              kVerticalSpace(30),
              _addDateBar(),
              kVerticalSpace(20),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (ctx, index) {
                  return Container(
                    height: 160,
                    width: Get.width,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.amber.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Team Meeting', style: kTextStyleBoldWhite(20)),
                        Text('Group discussion for new product right now',
                            style: kTextStyleBoldBlack(16), maxLines: 2),
                        Text('10:00 AM', style: kTextStyleBoldWhite(16)),
                        Text('Progress', style: kTextStyleBoldWhite(20)),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _addDateBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1,
          color: Colors.amber.withOpacity(0.2),
        ),
      ),
      child: DatePicker(
        height: 120,
        width: 65,
        DateTime.now(),
        initialSelectedDate: DateTime.now(),
        selectionColor: Colors.amber.withOpacity(0.5),
        monthTextStyle: kTextStyleBoldBlack(16),
        dayTextStyle: kTextStyleBoldBlack(16),
        dateTextStyle: kTextStyleBoldBlack(18),
        onDateChange: (selectedDate) {
          _selectedDate = selectedDate;
        },
      ),
    );
  }
}
