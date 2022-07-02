import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/db/db_helper.dart';
import 'package:todo/models/task_model.dart';

class TaskController extends GetxController {
  var tasksList = <TaskModel>[].obs;
  var todayTasksList = <TaskModel>[].obs;
  int get tasksLength => tasksList.length;

  @override
  void onInit() {
    getAllTasks();
    super.onInit();
  }

  void getTodayTasks() {
    final today = DateFormat.yMd().format(DateTime.now());
    Set<TaskModel> items = {};
    for (var task in tasksList) {
      if (task.date == today) {
        items.add(task);
      }
    }
    todayTasksList.assignAll(items.toList());
  }

  Future<int> addTask(TaskModel task) async {
    return await DBHelper.insert(task);
  }

  void getAllTasks() async {
    List<Map<String, dynamic>> tasks =
        await DBHelper.query() as List<Map<String, dynamic>>;
    tasksList.value = tasks.map((data) => TaskModel.fromJson(data)).toList();
    getTodayTasks();
  }

  void delete(TaskModel task) async {
    await DBHelper.delete(task);
    getAllTasks();
  }

  void updateTaskAsDone(int id) async {
    await DBHelper.update(id);
    getAllTasks();
  }
}
