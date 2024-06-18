// ignore_for_file: unused_local_variable

import 'package:get/instance_manager.dart';
import 'package:student_management/features/addpage/presentation/state/pick_image_getx.dart';
import 'package:student_management/features/home/presentation/state/homepage_getx.dart';

class Widgetbind extends Bindings{
  @override
  void dependencies() {
    HomepageGetx homepageGetx=Get.put(HomepageGetx());
    PickImageGetx pickImageGetx=Get.put(PickImageGetx());
  }
}