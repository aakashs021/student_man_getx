import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'package:student_management/features/addpage/presentation/state/location_feild_getx.dart';

Widget locationtextfeild(String? txt) {
  return GetBuilder<LocationFeildGetx>(
    builder: (controller) {
      controller.onSet(txt);
      return TextFormField(
        controller: controller.controller,
        decoration: InputDecoration(
          labelText: 'Location',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a location';
          }
          return null;
        },
      );
    },
  );
}