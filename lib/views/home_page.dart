import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:todo/utils/constants.dart';
import 'package:todo/views/all_tasks_page.dart';
import 'package:todo/widgets/home/app_bar.dart';
import 'package:todo/widgets/home/task_status.dart';
import 'package:todo/widgets/home/today_task_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyAppBar(),
              kVerticalSpace(40),
              Text(
                'Good Morning, Bersyte!',
                style: kTextStyleBoldGrey(22.0),
              ),
              Text(
                'You have 31 tasks\nthis month!',
                style: kTextStyleBoldBlack(30),
              ),
              kVerticalSpace(30),
              Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: TextField(
                    style: kTextStyleBoldBlack(22.0),
                    maxLines: 1,
                    autocorrect: false,
                    decoration: InputDecoration(
                      hintText: 'Search a task...',
                      prefixIcon: const Icon(Icons.search, size: 30),
                      hintStyle: kTextStyleBoldGrey(20.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              kVerticalSpace(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  TaskStatusContainer(
                    label: 'To-Do',
                    iconData: Icons.assignment_rounded,
                    color: Colors.pink,
                  ),
                  TaskStatusContainer(
                    label: 'Progress',
                    iconData: Icons.assignment_late_rounded,
                    color: Colors.amber,
                  ),
                  TaskStatusContainer(
                    label: 'Done',
                    iconData: Icons.assignment_turned_in,
                    color: Colors.green,
                  ),
                ],
              ),
              kVerticalSpace(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Today\'s Tasks', style: kTextStyleBoldBlack(30)),
                  TextButton(
                    onPressed: () {
                      Get.to(() => AllTasksPage(), transition: Transition.zoom);
                    },
                    child: Text('See All', style: kTextStyleBoldGrey(18)),
                  )
                ],
              ),
              SizedBox(
                height: 210,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (ctx, index) {
                    return TodayTaskTile(index: index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
