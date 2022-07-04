import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/task_controller.dart';
import 'package:todo/utils/constants.dart';
import 'package:todo/widgets/custom_circle_container.dart';
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
              _header(status),
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
                  MyRoutes.getTaskDetailRoute(),
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
                  MyRoutes.getTaskDetailRoute(),
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

  Widget _header(String status) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomCircleContainer(
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
          status == "Favorite" ? 'Favorites Tasks' : 'Tasks $status',
          style: kTextStyleBoldBlack(22),
        ),
        CustomCircleContainer(
          child: _iconByStatus(status),
        ),
      ],
    );
  }

  Widget _iconByStatus(String status) {
    switch (status) {
      case 'To-Do':
        return const Icon(
          Icons.assignment,
          size: 24,
        );
      case 'In Progress':
        return const Icon(
          Icons.incomplete_circle,
          size: 24,
        );
      case 'Done':
        return const Icon(
          Icons.done,
          size: 24,
        );
      case 'Favorite':
        return const Icon(
          Icons.favorite,
          size: 24,
        );
    }
    return const Icon(
      Icons.favorite,
      size: 24,
    );
  }
}
