import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:student_management/features/addpage/presentation/state/radio_getx.dart';


Widget radio({required BuildContext context, required String? gender}) {
  return GetBuilder<RadioGetx>(
    builder: (controller) {
      controller.setgender(gender);
      gender = null;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Gender',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: const Text('Male'),
            leading: Radio<String>(
              activeColor: Colors.black,
              value: 'Male',
              groupValue: controller.gender,
              onChanged: (String? val) {
                controller.onchanged(val);
              },
            ),
          ),
          ListTile(
            title: const Text('Female'),
            leading: Radio<String>(
              activeColor: Colors.black,
              value: 'Female',
              groupValue: controller.gender,
              onChanged: (String? val) {
                controller.onchanged(val);
              },
            ),
          ),
        ],
      );
    },
  );
}

