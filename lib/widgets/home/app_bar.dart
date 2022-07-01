import 'package:flutter/material.dart';
import 'package:todo/utils/constants.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 25,
          child: IconButton(
            onPressed: () {
              print('Open Drawer Home page header');
            },
            icon: const Icon(Icons.menu_outlined),
          ),
        ),
        Text('Todo App', style: kTextStyleBoldBlack(24)),
        const CircleAvatar(
          radius: 25,
          child: Icon(Icons.person),
        ),
      ],
    );
  }
}
