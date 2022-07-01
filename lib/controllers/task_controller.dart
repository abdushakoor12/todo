import 'package:get/get.dart';
import 'package:todo/db/db_helper.dart';
import 'package:todo/models/task_model.dart';

class TaskController extends GetxController {
  var tasksList = <TaskModel>[].obs;

  Future<int> addTask(TaskModel task) async {
    return await DBHelper.insert(task);
  }

  void getAllTasks() async {
    List<Map<String, dynamic>> tasks =
        await DBHelper.query() as List<Map<String, dynamic>>;
    tasksList.assignAll(
      tasks.map((data) => TaskModel.fromJson(data)).toList(),
    );
  }
}
