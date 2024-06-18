import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management/core/styles/colors.dart';
import 'package:student_management/features/addpage/presentation/ui/widgets/add_screen1.dart';
import 'package:student_management/student%20model/student_model.dart';

Expanded elevatededitbutton(BuildContext context, StudentModel sd) {
  return Expanded(
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
      onPressed: () {
        Get.to(()=> AddScreen1(image: sd.image,name: sd.name,location: sd.location,phonenumber: sd.phonenumber,
        standard: sd.standard,dateTime: sd.dateTime,gender: sd.gender,id: sd.id,
        ));
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => AddScreen(
        //     id: sd.id,
        //     name: sd.name,
        //     location: sd.location,
        //     phonenumber: sd.phonenumber,
        //     standard: sd.standard,
        //     gender: sd.gender,
        //     image: sd.image,
        //     dateTime: sd.dateTime,
        //   ),
        // ));
      },
      child: const Text(
        'Edit',
        style: TextStyle(fontSize: 16, color: white),
      ),
    ),
  );
}
