import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/task_controller.dart';
import 'package:todo/utils/constants.dart';
import '../utils/routes.dart';
import '../widgets/all_tasks/task_tile.dart';

class TasksByStatus extends StatelessWidget {
  TasksByStatus({Key? key}) : super(key: key);
  final TaskController _taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    final status = Get.arguments['status'] as String;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.amber.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 28,
                      ),
                    ),
                  ),
                  Text(
                    status == "Favorite" ? 'Favorites' : 'Tasks $status',
                    style: kTextStyleBoldBlack(22),
                  ),
                  Container(),
                ],
              ),
              kVerticalSpace(20),
              _displayTasks(status),
            ],
          ),
        ),
      ),
    );
  }

  Widget _displayTasks(String status) {
    return Obx(() {
      final tasks = _taskController.tasksList;

      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: tasks.length,
        itemBuilder: (ctx, index) {
          final task = tasks[index];
          if (task.status == status) {
            return InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                Get.toNamed(
                  MyRoutes.getDetailRoute(),
                  arguments: {'task': task},
                );
              },
              child: TaskTile(task: task),
            );
          } else if (status == 'Favorite' && task.isFavorite == 1) {
            return InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                Get.toNamed(
                  MyRoutes.getDetailRoute(),
                  arguments: {'task': task},
                );
              },
              child: TaskTile(task: task),
            );
          }
          return Container();
        },
      );
    });
  }
}
