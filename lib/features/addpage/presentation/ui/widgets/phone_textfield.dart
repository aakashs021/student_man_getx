import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:student_management/features/addpage/presentation/state/phone_feild_getx.dart';


Widget phonetextfeild(String? txt) {
  return GetBuilder<PhoneFeildGetx>(builder: (controller) {
    controller.onSet(txt);
    return TextFormField(
      controller: controller.controller,
      decoration: InputDecoration(
        labelText: 'Phone Number',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a phone number';
        }
        if (!RegExp(r'^\d{10}$').hasMatch(value)) {
          return 'Please enter a valid phone number';
        }
        return null;
      },
    );
  });
}