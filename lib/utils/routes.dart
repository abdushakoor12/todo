import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/views/all_tasks_page.dart';
import 'package:todo/views/create_task_page.dart';
import 'package:todo/views/home_page.dart';
import 'package:todo/views/task_detail.dart';

class MyRoutes {
  static const String _home = "/";
  static const String _allTasks = "/AllTasksPage";
  static const String _createTask = "/CreateTaskPage";
  static const String _taskDetail = "/TaskDetail";

  static String getHomeRoute() => _home;
  static String getAllTasksPageRoute() => _allTasks;
  static String getCreateTaskRoute() => _createTask;
  static String getDetailRoute() => _taskDetail;

  static List<GetPage> routes = [
    GetPage(
      name: _home,
      page: () => const HomePage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: _allTasks,
      page: () => const AllTasksPage(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: _createTask,
      page: () => const CreateTaskPage(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: _taskDetail,
      page: () => const TaskDetail(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 400),
    )
  ];
}
