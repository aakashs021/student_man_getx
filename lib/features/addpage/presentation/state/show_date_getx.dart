import 'package:get/get.dart';

class ShowDateGetx extends GetxController{
  DateTime? dateTime;
  bool ispicked=true;

  oninit(){
    dateTime=null;
  }

  onpicked(DateTime? value){
    if(value!=null){
      dateTime=value;
      ispicked=true;
      update();
    }
  }
  ispickedornot(){
    ispicked=false;
    update();
  }

  setdatetime(DateTime? date){
    if(date!=null){
      dateTime=date;
    }
  }

  onsubmit(){
    dateTime=null;
    ispicked=true;
  }
}