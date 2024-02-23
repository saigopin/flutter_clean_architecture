import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/features/auth/presentation/signup/sign_up_screen.dart';
import 'package:flutter_clean_architecture/src/features/auth/presentation/widget/button_widget.dart';
import 'package:flutter_clean_architecture/src/features/auth/presentation/widget/extensions.dart';
import 'package:flutter_clean_architecture/src/features/auth/presentation/widget/text_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 35),
              const Text(
                'Welcome Back !',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const Text(
                'please login to contionue',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              TextFormFieldWidget(
                controller: TextEditingController(),
                label: 'Email',
                hintText: 'Enter Email Address',
              ),
              const SizedBox(height: 20),
              TextFormFieldWidget(
                controller: TextEditingController(),
                label: 'Password',
                hintText: 'Enter Password',
                obscureText: true,
                suffixIcon: const Icon(Icons.visibility_off),
                validator: (String? value) {
                  return 'Required';
                },
              ),
              const SizedBox(height: 20),
              ButtonWidget(
                onPressed: () {},
                text: 'Login',
                borderRadius: 10.0,
              ).isLoading(false),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text("Don't have an Account ?"),
                  GestureDetector(
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute<SignUpScreen>(
                          builder: (BuildContext context) =>
                              const SignUpScreen(),
                        )),
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue.shade900,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
