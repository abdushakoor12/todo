import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/utils/constants.dart';
import 'package:todo/utils/routes.dart';
import 'package:todo/widgets/home/app_bar.dart';
import 'package:todo/widgets/home/task_status.dart';
import 'package:todo/widgets/home/today_task_tile.dart';
import '../controllers/task_controller.dart';
import '../models/task_model.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();
  final TaskController _taskController = Get.put(TaskController());

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
                '${showGreeting()}, Bersyte!',
                style: kTextStyleBoldGrey(22.0),
              ),
              GetX<TaskController>(
                builder: (controller) {
                  final tasks = controller.tasksList;
                  for (var task in tasks) {
                    changeTaskStatusAutomatically(task);
                  }
                  return tasks.isEmpty
                      ? _doNotHaveTaskForMonth()
                      : Text(
                          'You have ${controller.tasksLength} tasks\nthis month!',
                          style: kTextStyleBoldBlack(30),
                        );
                },
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
                    controller: _controller,
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
                children: [
                  TaskStatusContainer(
                    label: 'To-Do',
                    iconData: Icons.assignment_rounded,
                    color: Colors.pink,
                    onTap: () {
                      _goToTasksByStatus('To-Do');
                    },
                  ),
                  TaskStatusContainer(
                      label: 'Progress',
                      iconData: Icons.assignment_late_rounded,
                      color: Colors.amber,
                      onTap: () {
                        _goToTasksByStatus('In Progress');
                      }),
                  TaskStatusContainer(
                      label: 'Done',
                      iconData: Icons.assignment_turned_in,
                      color: Colors.green,
                      onTap: () {
                        _goToTasksByStatus('Done');
                      }),
                ],
              ),
              kVerticalSpace(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Today\'s Tasks', style: kTextStyleBoldBlack(30)),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(
                        MyRoutes.getAllTasksPageRoute(),
                      );
                    },
                    child: Text('See All', style: kTextStyleBoldGrey(18)),
                  )
                ],
              ),
              _displayTodayTasks(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _displayTodayTasks() {
    return GetX<TaskController>(
      builder: (controller) {
        final tasks = controller.todayTasksList;
        return SizedBox(
          height: tasks.isEmpty ? 180 : 210,
          child:
              tasks.isEmpty ? _doNotHaveTaskToday() : _hasTaskForToday(tasks),
        );
      },
    );
  }

  Widget _doNotHaveTaskToday() {
    return Container(
      width: Get.width,
      height: 180,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(0.35),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You don't have task \nfor today!",
              style: kTextStyleBlack(23),
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: () {
                Get.toNamed(MyRoutes.getCreateTaskRoute());
              },
              child: Text(
                "Click Here to Create One",
                style: kTextStyleBoldBlack(20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _hasTaskForToday(List<TaskModel> tasks) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: tasks.length,
      itemBuilder: (ctx, index) {
        final task = tasks[index];
        return InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            Get.toNamed(
              MyRoutes.getDetailRoute(),
              arguments: {'task': task},
            );
          },
          child: TodayTaskTile(task: task),
        );
      },
    );
  }

  Widget _doNotHaveTaskForMonth() {
    return SizedBox(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "You don't have tasks for",
            style: kTextStyleBoldBlack(30),
          ),
          Row(
            children: [
              Text(
                "this month yet!",
                style: kTextStyleBoldBlack(30),
              ),
              Flexible(
                child: TextButton(
                  onPressed: () {
                    Get.toNamed(MyRoutes.getCreateTaskRoute());
                  },
                  child: Text(
                    "Create One",
                    style: kTextStyleBoldAmber(20),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _goToTasksByStatus(String status) {
    Get.toNamed(
      MyRoutes.getTasksByStatusRoute(),
      arguments: {'status': status},
    );
  }
}
