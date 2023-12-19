import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'AuthController.dart';
import 'ForgetPassword.dart';
import 'SginUp.dart';
import 'Controller.dart';


class LoginPage extends StatelessWidget {
  final MainController controller = Get.find();
  final  AuthController  authController = Get.find();
  final TextEditingController Password = TextEditingController();
  final TextEditingController Email = TextEditingController();
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
          child:Form(
            key:formKey,
            child:
           Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FlutterLogo(size: 100),
              SizedBox(height: 16),
              Text(
                'Login',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              TextFormField(
                  controller: Email,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter a Email';
                    }
                    return null;
                  },
                ),
              SizedBox(height: 16),
                TextFormField(
                  controller: Password,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty ) {
                      return 'Please Enter a password';
                    }
                    return null;
                  },
                ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                    if (formKey.currentState?.validate() ?? false) {
                      // Form is valid, proceed with SignUp
                      await authController.Login(Email.text, Password.text);
                      Email.clear();
                      Password.clear();
                    }
                },
                child: Text('Login'),
              ),
              SizedBox(height: 16),
              TextButton(onPressed: (){Get.to(SignUpPage());}, child: Text("Create New Accont")),
              TextButton(onPressed: (){Get.to(ForgetPassword());}, child: Text("I Forget My Password")),
            ],
          ),
        )
        ),
      ),
    );
  }
}
