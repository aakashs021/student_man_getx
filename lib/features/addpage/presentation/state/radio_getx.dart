import 'package:get/get.dart';

class RadioGetx extends GetxController{
   String gender='Male';

  setgender(String? gender){
    if(gender!=null){
      this. gender=gender;
    }
  }
  onchanged(String? value){
    gender=value!;
    update();
  }
  onsubmit(){
    gender='Male';
  }
}