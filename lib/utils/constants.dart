import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo/controllers/task_controller.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/utils/routes.dart';

TextStyle kTextStyleGrey(double size) {
  return GoogleFonts.arimaMadurai(
    textStyle: TextStyle(fontSize: size, color: Colors.grey),
  );
}

TextStyle kTextStyleWhite(double size) {
  return GoogleFonts.arimaMadurai(
    textStyle: TextStyle(fontSize: size, color: Colors.white),
  );
}

TextStyle kTextStyleBlack(double size) {
  return GoogleFonts.arimaMadurai(
    textStyle: TextStyle(
      fontSize: size,
      color: Colors.black,
    ),
  );
}

TextStyle kTextStyleBoldGrey(double size) {
  return GoogleFonts.arimaMadurai(
    textStyle: TextStyle(
      fontSize: size,
      color: Colors.grey,
      fontWeight: FontWeight.bold,
    ),
  );
}

TextStyle kTextStyleBoldBlack(double size) {
  return GoogleFonts.arimaMadurai(
    textStyle: TextStyle(
      fontSize: size,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  );
}

TextStyle kTextStyleBoldAmber(double size) {
  return GoogleFonts.arimaMadurai(
    textStyle: TextStyle(
      fontSize: size,
      color: Colors.amber,
      fontWeight: FontWeight.bold,
    ),
  );
}

TextStyle kTextStyleBoldWhite(double size) {
  return GoogleFonts.arimaMadurai(
    textStyle: TextStyle(
      fontSize: size,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget kVerticalSpace(double height) => SizedBox(height: height);

const List<Color> colors = [
  Colors.pink,
  Colors.purple,
  Colors.amber,
  Colors.orange,
  Colors.teal,
  Colors.green,
  Colors.blue,
  Colors.blueGrey,
];

String showGreeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Good Morning';
  } else if (hour < 18) {
    return 'Good Afternoon';
  } else if (hour < 5) {
    return 'Good Night';
  } else if (hour > 17 && hour < 24) {
    return 'Good Evening';
  }
  return 'Good Night';
}

changeTaskStatusAutomatically(TaskModel task) {
  final date = DateFormat.yMd().format(DateTime.now());
  var time = formattingTimeOfDay(TimeOfDay.now());
  if (task.date == date && task.time == time) {
    print('In Progress');
  }

  print('Task id${task.id} Time:${task.time} == Now Time:$time');
  print('Task id${task.id} Date : ${task.date} == Now Date : $date');
}

String formattingTimeOfDay(TimeOfDay timeOfDay) {
  final now = DateTime.now();
  final date = DateTime(
    now.year,
    now.month,
    now.day,
    timeOfDay.hour,
    timeOfDay.minute,
  );
  final format = DateFormat.jm();
  return format.format(date);
}
