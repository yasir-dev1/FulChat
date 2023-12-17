import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Login.dart';
import 'Controller.dart';
void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget{
  MainController controller  = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    ) ;
  }

}