import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/setting_controller.dart';
import 'package:todo/widgets/create_task/custom_text_field.dart';
import 'package:todo/widgets/custom_button.dart';
import '../utils/constants.dart';
import '../widgets/custom_circle_container.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);
  final TextEditingController _nameController = TextEditingController();
  final SettingsController _settingController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(),
              kVerticalSpace(20),
              _iconTextRow(icon: Icons.person, label: 'Username'),
              _displayName(context),
              Divider(thickness: 2, color: Colors.amber.withOpacity(0.3)),
              Text('Get in Touch With Dev', style: kTextStyleBlack(20)),
              Divider(thickness: 2, color: Colors.amber.withOpacity(0.3)),
              _iconTextRow(icon: FontAwesomeIcons.twitter, label: 'Twitter'),
              _iconTextRow(icon: FontAwesomeIcons.github, label: 'Github'),
              _iconTextRow(
                icon: FontAwesomeIcons.instagram,
                label: 'Instagram',
              ),
              _iconTextRow(icon: FontAwesomeIcons.linkedin, label: 'LinkedIn'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconTextRow({required String label, required IconData icon}) {
    return TextButton(
      onPressed: () {
        if (label == 'LinkedIn') _settingController.openLinkedIn();
        if (label == 'Twitter') _settingController.openTwitter();
        if (label == 'Github') _settingController.openGithub();
        if (label == 'Instagram') _settingController.openInstagram();
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FaIcon(icon, size: 24),
          const SizedBox(width: 10),
          Text(label, style: kTextStyleBlack(20)),
        ],
      ),
    );
  }

  Widget _displayName(BuildContext context) {
    return Row(
      children: [
        Obx(() {
          _nameController.text = _settingController.username.value;
          return Text(
            _settingController.username.value,
            style: kTextStyleBoldBlack(24),
            maxLines: 1,
          );
        }),
        IconButton(
          onPressed: () => _showDialog(context),
          icon: const Icon(Icons.edit),
        ),
      ],
    );
  }

  _saveNameToStorage() {
    if (_nameController.text.trim().isNotEmpty) {
      final name = _nameController.text.trim();
      _settingController.saveName(name);
      Get.back();
    } else {
      Get.snackbar(
        'Name is Empty',
        "Name can't be empty Please!",
        colorText: Colors.white,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  _showDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          content: SizedBox(
            height: Get.height * 0.25,
            child: Column(
              children: [
                Text('Enter Your Name', style: kTextStyleBoldBlack(20)),
                CustomTextField(
                  controller: _nameController,
                  label: '',
                  hintText: 'Write Your Name here...',
                ),
                CustomButton(
                  onTap: _saveNameToStorage,
                  label: 'Save',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomCircleContainer(
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 28,
            ),
          ),
        ),
        Text(
          "Settings",
          style: kTextStyleBoldBlack(22),
        ),
        const CustomCircleContainer(
          child: Icon(Icons.settings),
        ),
      ],
    );
  }
}
