import 'package:flutter/material.dart';
import 'package:todo/utils/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, this.onTap}) : super(key: key);

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 125,
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add),
            Text('Add Task', style: kTextStyleBoldBlack(18))
          ],
        ),
      ),
    );
  }
}
