import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({Key? key, required this.child, required this.color})
      : super(key: key);

  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1,
          color: Colors.amber.withOpacity(0.2),
        ),
      ),
      child: child,
    );
  }
}
