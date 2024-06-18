import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PickImageGetx extends GetxController{

  String? image;

  onImagepick()async{
final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    this.image=image?.path;
    update();
  }

  setImage(String? imagePath) {
    if(imagePath=='no'){
      image=null;
    }
    else if ( imagePath !=null) {
    image = imagePath;
    }
  }
}