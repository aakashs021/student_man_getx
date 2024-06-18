import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';
import 'package:student_management/core/styles/colors.dart';
import 'package:student_management/database/database.dart';
import 'package:student_management/database/databasedesktop.dart';
import 'package:student_management/features/home/presentation/state/homepage_getx.dart';
import 'package:student_management/features/home/presentation/ui/widgets/home_screen.dart';
import 'package:student_management/student%20model/student_model.dart';

Expanded elevatedeletebutton(
    BuildContext context, Color background, StudentModel sd) {
  return Expanded(
    child: ElevatedButton(
      onPressed: () async {
        QuickAlert.show(
          animType: QuickAlertAnimType.slideInUp,
          context: context,
          type: QuickAlertType.confirm,
          title: 'Are you sure you want to delete?',
          confirmBtnText: 'Delete',
          cancelBtnText: 'Cancel',
          confirmBtnColor: Colors.red,
          onConfirmBtnTap: () async {
            await ondeletepressed(context, sd);
          },
          onCancelBtnTap: () => Get.back(),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
      child: const Text(
        'Delete',
        style: TextStyle(fontSize: 16, color: white),
      ),
    ),
  );
}

Future<void> ondeletepressed(context, StudentModel sd) async {
  await delete(sd.id);
  await get();
  Get.find<HomepageGetx>().filterlist.value=studentmodellist;
  Get.offAll(()=>HomeScreen());
}
