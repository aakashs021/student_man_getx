import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management/database/databasedesktop.dart';
import 'package:student_management/student%20model/student_model.dart';

class HomepageGetx extends GetxController {
  TextEditingController searchcontroller = TextEditingController();
  RxList<StudentModel> filterlist = RxList<StudentModel>(studentmodellist);
  Timer? debounce;


  void onSearch(String txt) {
    if (debounce != null && debounce!.isActive) {
      debounce!.cancel();
    }
    debounce = Timer(const Duration(seconds: 1), () {
      filterlist.value = studentmodellist.where((element) {
        return element.name.toLowerCase().contains(txt.toLowerCase());
      }).toList();
    });
  }

  void oncloseicon() {
    filterlist.value = studentmodellist;
    searchcontroller.clear();
  }
}
