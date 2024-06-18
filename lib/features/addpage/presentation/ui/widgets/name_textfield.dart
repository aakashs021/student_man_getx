import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:student_management/features/addpage/presentation/state/name_feild_getx.dart';


Widget nametextfeild(String? txt) {
  return GetBuilder<NameFeildGetx>(
    builder: (controller) {
      controller.onSet(txt);
      txt = null;
      return TextFormField(
        controller: controller.controller,
        decoration: InputDecoration(
          labelText: 'Name',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a name';
          }
          return null;
        },
      );
    },
  );
}