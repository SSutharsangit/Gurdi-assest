import 'package:flutter/material.dart';
import 'package:home_services/others/auth/login/presenters/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController=LoginController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  bool _passwordVisible = true;
  String? _selectedOption="Customer"; // New variable to hold the selected radio button value

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
                const Text(
                  'Welcome Back To',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const Text(
                  'Guard Assist',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const Text(
                  'Hello there, login to continue',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 24,
                ),
                // Radio buttons
                Row(
                  children: <Widget>[
                    Expanded(
                      child: RadioListTile<String>(
                        title: Text('Customer'),
                        value: 'Customer',
                        groupValue: _selectedOption,
                        onChanged: (value) {
                          setState(() {
                            _selectedOption = value;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        title: Text('Provider'),
                        value: 'Provider',
                        groupValue: _selectedOption,
                        onChanged: (value) {
                          setState(() {
                            _selectedOption = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                // End of radio buttons
                const SizedBox(
                  height: 24,
                ),
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
                    labelText: 'Username',
                    hintText: 'Type Username...',
                    hintStyle: TextStyle(color: Colors.grey[700]),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
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
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.grey[700]),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: const Color(0xff0A8494),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forgot-password');
                    },
                    child: const Text(
                      'Forgot Password?',
                      textAlign: TextAlign.end,
                      style: TextStyle(color: Color(0xff0A8494)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                   loginController.login("${emailController.text}", "${passwordController.text}", "$_selectedOption",context);
                    print('Username: ${emailController.text}');
                    print('Password: ${passwordController.text}');
                    print('Selected Option: $_selectedOption');
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff0A8494),
                    ),
                    child: const Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/SignUpPage');
                      },
                      child: const Text(
                        'Sign Up',
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
