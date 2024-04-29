import 'dart:async';

import 'package:flutter/material.dart';
import 'package:home_services/others/auth/login/presenters/login_controller.dart';
import 'package:home_services/others/auth/register/presenters/register_controller.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
   RegisterController registerController = RegisterController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController imgController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  bool _passwordVisible = true;
  String? _selectedRole = "Customer"; // New variable to hold the selected role

  @override
  void dispose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    "Create Account",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Additional input fields for registration
                TextField(
                  controller: nameController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff0A8494)),
                    ),
                    labelText: 'Name',
                    hintText: 'Enter your name',
                    hintStyle: TextStyle(color: Colors.grey[700]),
                  ),
                ),
                const SizedBox(height: 6),
                TextField(
                  controller: emailController,
                  focusNode: emailFocusNode,
                  textInputAction: TextInputAction.next,
                  onSubmitted: (_) {
                    FocusScope.of(context).requestFocus(passwordFocusNode);
                  },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff0A8494)),
                    ),
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    hintStyle: TextStyle(color: Colors.grey[700]),
                  ),
                ),
                const SizedBox(height: 6),
                TextField(
                  controller: mobileController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff0A8494)),
                    ),
                    labelText: 'Mobile',
                    hintText: 'Enter your mobile number',
                    hintStyle: TextStyle(color: Colors.grey[700]),
                  ),
                ),
                const SizedBox(height: 6),
                // TextField(
                //   controller: imgController,
                //   textInputAction: TextInputAction.next,
                //   decoration: InputDecoration(
                //     border: const OutlineInputBorder(
                //       borderSide: BorderSide(color: Color(0xff0A8494)),
                //     ),
                //     labelText: 'Profile Image',
                //     hintText: 'Enter URL of your profile image',
                //     hintStyle: TextStyle(color: Colors.grey[700]),
                //   ),
                // ),
            
                TextField(
                  controller: usernameController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff0A8494)),
                    ),
                    labelText: 'Username',
                    hintText: 'Enter your username',
                    hintStyle: TextStyle(color: Colors.grey[700]),
                  ),
                ),
                const SizedBox(height: 6),
                // Radio buttons for role selection
                Row(
                  children: <Widget>[
                    Expanded(
                      child: RadioListTile<String>(
                        title: Text('Customer'),
                        value: 'Customer',
                        groupValue: _selectedRole,
                        onChanged: (value) {
                          setState(() {
                            _selectedRole = value;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        title: Text('Provider'),
                        value: 'Provider',
                        groupValue: _selectedRole,
                        onChanged: (value) {
                          setState(() {
                            _selectedRole = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                // End of radio buttons
                const SizedBox(height: 6),
                TextField(
                  controller: passwordController,
                  obscureText: _passwordVisible,
                  focusNode: passwordFocusNode,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff0A8494)),
                    ),
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(color: Colors.grey[700]),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                      icon: Icon(
                        _passwordVisible ? Icons.visibility_off : Icons.visibility,
                        color: const Color(0xff0A8494),
                      ),
                    ),
                  ),
                ),
               
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    // Register user
                    FocusScope.of(context).unfocus();
                   registerController.signup(
    nameController.text,
    emailController.text,
    mobileController.text,
    usernameController.text,
    passwordController.text,
    _selectedRole,
    context,
  );
  print("hi");
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff0A8494),
                    ),
                    child: const Center(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Already have an account? "),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/LoginScreen');
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Color(0xff0A8494)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
