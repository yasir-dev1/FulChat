import 'package:get/get.dart';

class Firend {
  String? username;
  String? State; 



}



class MainController extends GetxController{

  var Firends = <Firend> [].obs;
  String?  username;


  Future <void>  Login (Password,Username) async {
    username = Username;
  }
  Future <void> SignUp (Username,Password,Email) async {
    
  }
  Future  <void> ForgetPassword (Email)  async {
    
  }



}

