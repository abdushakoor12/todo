import 'package:flutter/material.dart';
import 'package:todo/utils/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, this.onTap, required this.label, this.iconData})
      : super(key: key);

  final VoidCallback? onTap;
  final String label;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 125,
      decoration: BoxDecoration(
        color: label == 'Done'
            ? Colors.green.withOpacity(0.3)
            : Colors.amber.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconData == null) Container() else Icon(iconData),
            Text(label, style: kTextStyleBoldBlack(18))
          ],
        ),
      ),
    );
  }
}
