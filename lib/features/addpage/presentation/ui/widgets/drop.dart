import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:student_management/features/addpage/presentation/state/standard_getx.dart';


Widget drop(String? stand) {
  return GetBuilder<StandardGetx>(
    builder: (controller) {
      controller.setstandard(stand);
      stand = null;
      return DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: 'Standard',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        value: controller.standard,
        items: controller.standards.map((String standard) {
          return DropdownMenuItem<String>(
            value: standard,
            child: Text(standard),
          );
        }).toList(),
        onChanged: (newValue) {
          controller.onchanged(newValue);
        },
      );
    },
  );
}