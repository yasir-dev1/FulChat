import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_messenger/Login.dart';
import 'package:whatsapp_messenger/Controller.dart';
import 'AuthController.dart';

class SignUpPage extends StatelessWidget {
  final  AuthController  authController = Get.find();
  final MainController controller = Get.find();
  final TextEditingController password = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RotationTransition(turns:AlwaysStoppedAnimation(45/360),child: FlutterLogo(size: 100),),
                SizedBox(height: 16),
                Text(
                  'SignUp',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: username,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a valid username';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || !GetUtils.isEmail(value)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState?.validate() ?? false) {
                      // Form is valid, proceed with SignUp
                      await authController.Reg(email.text, password.text);
                      username.clear();
                      password.clear();
                    }
                  },
                  child: Text('SignUp'),
                ),
                SizedBox(height: 16),
                SizedBox(height: 16,),
                TextButton(
                  onPressed: () {
                    Get.to(LoginPage());
                  },
                  child: Text("I Have Accont"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
