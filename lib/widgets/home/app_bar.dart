import 'package:flutter/material.dart';
import 'package:todo/utils/constants.dart';
import 'package:todo/widgets/custom_circle_container.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key, this.pressToOpenDrawer}) : super(key: key);

  final VoidCallback? pressToOpenDrawer;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomCircleContainer(
          child: IconButton(
            onPressed: pressToOpenDrawer,
            icon: const Icon(Icons.menu_outlined),
          ),
        ),
        Text('Todo App', style: kTextStyleBoldBlack(24)),
        const CustomCircleContainer(
          child: Icon(Icons.person),
        ),
      ],
    );
  }
}
