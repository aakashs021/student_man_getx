import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management/database/database.dart';
import 'package:student_management/database/databasedesktop.dart';
import 'package:student_management/features/addpage/presentation/state/location_feild_getx.dart';
import 'package:student_management/features/addpage/presentation/state/name_feild_getx.dart';
import 'package:student_management/features/addpage/presentation/state/phone_feild_getx.dart';
import 'package:student_management/features/addpage/presentation/state/pick_image_getx.dart';
import 'package:student_management/features/addpage/presentation/state/radio_getx.dart';
import 'package:student_management/features/addpage/presentation/state/show_date_getx.dart';
import 'package:student_management/features/addpage/presentation/state/standard_getx.dart';
import 'package:student_management/features/detail/presentation/ui/widgets/detail_screen.dart';
import 'package:student_management/features/home/presentation/state/homepage_getx.dart';
import 'package:student_management/features/home/presentation/ui/widgets/home_screen.dart';
import 'package:student_management/student%20model/student_model.dart';


Widget submitbutton(var formkey, String? name, int? id) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(vertical: 15),
    ),
    onPressed: () async{
      ShowDateGetx date = Get.find<ShowDateGetx>();
      if (formkey.currentState!.validate()&&date.dateTime!=null) {
        StudentModel sd = StudentModel(
            id: id ?? DateTime.now().microsecondsSinceEpoch,
            image: Get.find<PickImageGetx>().image,
            name: Get.find<NameFeildGetx>().controller.text,
            location: Get.find<LocationFeildGetx>().controller.text,
            phonenumber: Get.find<PhoneFeildGetx>().controller.text,
            gender: Get.find<RadioGetx>().gender,
            standard: Get.find<StandardGetx>().standard,
            dateTime: Get.find<ShowDateGetx>().dateTime!);
            if (id == null) {
            await add(sd);
          } else {
            await update(sd);
          }
          await get();
          Get.find<HomepageGetx>().filterlist.value=studentmodellist;
          if(id==null){

          Get.off(()=> HomeScreen());
          }else{
            Get.back();
            Get.back();
            Get.to(()=> DetailScreen(sd: sd));
          }


      } else if (date.dateTime == null) {
        date.ispickedornot();
      }
    },
    child: Text(
      id != null ? 'Update' : 'Submit',
      style: const TextStyle(fontSize: 16, color: Colors.white),
    ),
  );
}