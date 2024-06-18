import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:lottie/lottie.dart';
import 'package:student_management/features/addpage/presentation/state/pick_image_getx.dart';


Widget imagepickwidget(String? image) {
  return GetBuilder<PickImageGetx>(builder: (controller) {
    controller.setImage(image);
    image = null;
    return GestureDetector(
      onTap: () async {
        controller.onImagepick();
      },
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 80,
        child: controller.image != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.file(
                  File(controller.image!),
                  width: 160,
                  fit: BoxFit.cover,
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                      width: 100, 'assets/lotties/camera_add_page.json'),
                  const SizedBox(
                    width: 120,
                    child: Text(
                      style: TextStyle(color: Colors.black),
                      'Select a profile picture',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
      ),
    );
  });
}
