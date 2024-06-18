import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:student_management/database/database.dart';
import 'package:student_management/features/addpage/presentation/state/location_feild_getx.dart';
import 'package:student_management/features/addpage/presentation/state/name_feild_getx.dart';
import 'package:student_management/features/addpage/presentation/state/phone_feild_getx.dart';
import 'package:student_management/features/addpage/presentation/state/pick_image_getx.dart';
import 'package:student_management/features/addpage/presentation/state/radio_getx.dart';
import 'package:student_management/features/addpage/presentation/state/show_date_getx.dart';
import 'package:student_management/features/addpage/presentation/state/standard_getx.dart';
import 'package:student_management/features/home/presentation/state/homepage_getx.dart';
import 'package:student_management/features/splash/presentation/ui/widgets/splash_screen.dart';

void main(List<String> args) async{
  WidgetsFlutterBinding.ensureInitialized();
  await initdb();
  await get();
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const GetMaterialApp(
      // initialBinding: ,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
void setupDependencies() {
  Get.put(HomepageGetx());
  Get.put(PickImageGetx());
  Get.put(NameFeildGetx());
  Get.put(LocationFeildGetx());
  Get.put(PhoneFeildGetx());
  Get.put(StandardGetx());
  Get.put(ShowDateGetx());
  Get.put(RadioGetx());
}