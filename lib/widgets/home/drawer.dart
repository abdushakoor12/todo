import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants.dart';
import '../../utils/routes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  //bottomRight: Radius.circular(20),
                  //bottomLeft: Radius.circular(20)),),
                  ),
              color: Colors.amber.withOpacity(0.3),
            ),
            child: Center(
              child: Text(
                'By Bersyte',
                style: kTextStyleBoldBlack(24),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _drawerItem(Icons.home, 'Home', () => Get.back()),
                kVerticalSpace(16),
                _drawerItem(Icons.favorite, 'Favorite', () {
                  Get.toNamed(
                    MyRoutes.getTasksByStatusRoute(),
                    arguments: {"status": "Favorite"},
                  );
                }),
                kVerticalSpace(16),
                _drawerItem(Icons.create, 'Create Task', () {
                  Get.toNamed(MyRoutes.getCreateTaskRoute());
                }),
                kVerticalSpace(16),
                _drawerItem(Icons.info, 'About App', () {}),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _drawerItem(IconData icon, String label, VoidCallback? onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.amber),
          const SizedBox(width: 10),
          Text(
            label,
            style: kTextStyleBlack(20),
          ),
        ],
      ),
    );
  }
}
