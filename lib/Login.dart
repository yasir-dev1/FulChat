import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ForgetPassword.dart';
import 'SginUp.dart';
import 'Controller.dart';


class LoginPage extends StatelessWidget {
  final MainController controller = Get.find();
  final TextEditingController Password = TextEditingController();
  final TextEditingController Username = TextEditingController();
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
                  controller: Username,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please a username';
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
                      controller.Login(Password.text, Username.text);
                      Username.clear();
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
