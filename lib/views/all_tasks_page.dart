import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/utils/constants.dart';
import 'package:todo/views/task_detail.dart';
import 'package:todo/widgets/all_tasks/all_task_header.dart';
import '../controllers/task_controller.dart';
import '../widgets/all_tasks/task_tile.dart';

class AllTasksPage extends StatefulWidget {
  const AllTasksPage({Key? key}) : super(key: key);

  @override
  State<AllTasksPage> createState() => _AllTasksPageState();
}

class _AllTasksPageState extends State<AllTasksPage> {
  DateTime _selectedDate = DateTime.now();
  final TaskController _taskController = Get.put(TaskController());

  @override
  void initState() {
    _taskController.getAllTasks();
    super.initState();
  }

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
              _displayTasks(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _displayTasks() {
    return Obx(
      () {
        final tasks = _taskController.tasksList;

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: tasks.length,
          itemBuilder: (ctx, index) {
            final task = tasks[index];
            //print(tasks.length);
            return InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                Get.to(
                  () => TaskDetail(task: task),
                  transition: Transition.zoom,
                  duration: const Duration(milliseconds: 500),
                );
              },
              child: TaskTile(task: task),
            );
          },
        );
      },
    );
  }

  Widget _addDateBar() {
    return Container(
      margin: const EdgeInsets.only(right: 8),
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
