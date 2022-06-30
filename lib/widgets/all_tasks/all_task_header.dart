import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../custom_button.dart';

class AllTaskHeader extends StatelessWidget {
  const AllTaskHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.amber.withOpacity(0.2),
            borderRadius: BorderRadius.circular(25),
          ),
          child: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back,
              size: 28,
            ),
          ),
        ),
        CustomButton(
          onTap: () {},
        ),
      ],
    );
  }
}
