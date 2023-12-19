import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:whatsapp_messenger/firebase_options.dart';
import 'Login.dart';
import 'Controller.dart';
import 'AuthController.dart';
Future <void> main () async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget{
  MainController controller  = Get.put(MainController());
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    ) ;
  }

}