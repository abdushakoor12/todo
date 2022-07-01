import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:todo/utils/constants.dart';
import 'package:todo/views/task_detail.dart';
import 'package:todo/widgets/all_tasks/all_task_header.dart';
import '../widgets/all_tasks/task_tile.dart';

class AllTasksPage extends StatelessWidget {
  AllTasksPage({Key? key}) : super(key: key);
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
                itemCount: 7,
                itemBuilder: (ctx, index) {
                  List<Color> colors = [
                    Colors.purple,
                    Colors.teal,
                    Colors.amber,
                    Colors.green,
                    Colors.blue,
                    Colors.blueGrey,
                    Colors.pink,
                  ];

                  return InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      Get.to(
                        () => TaskDetail(index: index),
                        transition: Transition.zoom,
                        duration: const Duration(milliseconds: 500),
                      );
                    },
                    child: TaskTile(color: colors[index]),
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
