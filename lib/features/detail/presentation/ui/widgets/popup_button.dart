 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management/core/styles/colors.dart';

IconButton popupbutton() {
    return IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: white,
            ),
          );
  }