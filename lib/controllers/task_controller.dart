import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:todo/db/db_helper.dart';
import 'package:todo/models/task_model.dart';

import '../utils/constants.dart';

class TaskController extends GetxController {
  var tasksList = <TaskModel>[].obs;
  var todayTasksList = <TaskModel>[].obs;
  int get tasksLength => tasksList.length;
  var taskById = <TaskModel>[].obs;

  @override
  void onInit() {
    getAllTasks();
    super.onInit();
  }

  void _getTodayTasks() {
    final today = DateFormat.yMd().format(DateTime.now());
    Set<TaskModel> items = {};
    for (var task in tasksList) {
      if (task.date == today) {
        items.add(task);
      }
    }
    todayTasksList.assignAll(items.toList());
  }

  void changeTaskStatusAutomatically() {
    final date = DateFormat.yMd().format(DateTime.now());
    var time = formattingTimeOfDay(TimeOfDay.now());
    for (var task in tasksList) {
      if (task.date == date && task.time == time) {
        updateTaskStatus(task.id as int, 'In Progress');
      }
    }
  }

  Future<int> addTask(TaskModel task) async {
    return await DBHelper.insert(task);
  }

  void getAllTasks() async {
    List<Map<String, dynamic>> tasks =
        await DBHelper.query() as List<Map<String, dynamic>>;
    tasksList.value = tasks.map((data) => TaskModel.fromJson(data)).toList();
    _getTodayTasks();
    changeTaskStatusAutomatically();
  }

  void delete(TaskModel task) async {
    await DBHelper.delete(task);
    getAllTasks();
  }

  void updateTaskAsDone(int id) async {
    await DBHelper.update(id);
    getAllTasks();
  }

  void updateTaskAsFav(int id) async {
    await DBHelper.updateFav(id);
    getAllTasks();
  }

  void removeFromFav(int id) async {
    await DBHelper.removeFav(id);
    getAllTasks();
  }

  void updateTaskStatus(int id, String status) async {
    await DBHelper.updateTaskStatus(id, status);
    getAllTasks();
  }

  void shareTask({required String title, required String description}) async {
    await Share.share(
      'Title: $title\n$description',
      subject: 'Share Task: $title',
    );
  }

  void getTaskById(int id) async {
    List<Map<String, dynamic>> task = await DBHelper.queryTaskById(id);
    taskById.assignAll(task.map((data) => TaskModel.fromJson(data)));
  }
}
