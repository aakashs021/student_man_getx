import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationFeildGetx extends GetxController{
  TextEditingController controller=TextEditingController();

  onSet(String? name){
    if(name=='no'){
      controller.text='';
    }else if(name!=null){
      controller.text=name;
    }
  }
}