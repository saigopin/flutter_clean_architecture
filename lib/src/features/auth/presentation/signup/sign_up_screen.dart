import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/features/auth/presentation/login/login_screen.dart';
import 'package:flutter_clean_architecture/src/features/auth/presentation/widget/button_widget.dart';
import 'package:flutter_clean_architecture/src/features/auth/presentation/widget/extensions.dart';
import 'package:flutter_clean_architecture/src/features/auth/presentation/widget/text_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                'Create An Account',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const Text(
                'please fill the below form details',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              TextFormFieldWidget(
                controller: TextEditingController(),
                label: 'Name',
                hintText: 'Enter Name',
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
              TextFormFieldWidget(
                controller: TextEditingController(),
                label: 'Confirm Password',
                hintText: 'Enter Confirm Password',
                obscureText: true,
                suffixIcon: const Icon(Icons.visibility_off),
                validator: (String? value) {
                  return 'Required';
                },
              ),
              const SizedBox(height: 20),
              ButtonWidget(
                onPressed: () {},
                text: 'Register',
                borderRadius: 10.0,
              ).isLoading(false),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text('Already have an Account ?'),
                  GestureDetector(
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute<LoginScreen>(
                          builder: (BuildContext context) =>
                              const LoginScreen(),
                        )),
                    child: Text(
                      'Login',
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
