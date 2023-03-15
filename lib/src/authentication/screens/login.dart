import 'package:flutter/material.dart';
import 'package:food_app/src/authentication/screens/register.dart';

import '../../../forgot_password.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isHidden = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _submitForm() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFFFF7DD),
          foregroundColor: Colors.black,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: Container(
                  color: const Color(0xFFFFF7DD),
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20.0),
                          Column(children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Image.asset(
                                'assets/images/user.png',
                                width: 130,
                                height: 130,
                              ),
                            ),
                            const Text(
                              'Welcome Back\nLog into account',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(254, 194, 43, 1)),
                            ),
                          ]),
                          Column(
                            children: [
                              const SizedBox(height: 50.0),
                              SizedBox(
                                width: 310,
                                child: TextField(
                                  controller: _emailController,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter your email',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(254, 194, 43, 1)),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              SizedBox(
                                width: 310,
                                child: TextField(
                                  controller: _passwordController,
                                  decoration: InputDecoration(
                                    hintText: 'Enter your password',
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(254, 194, 43, 1)),
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: _toggleVisibility,
                                      icon: _isHidden
                                          ? const Icon(Icons.visibility_off)
                                          : const Icon(Icons.visibility),
                                    ),
                                  ),
                                  obscureText: _isHidden,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              SizedBox(
                                width: 310,
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ForgotScreen()));
                                    },
                                    child: const Text("Forgot Password",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black))),
                              ),
                              const SizedBox(height: 20.0),
                              ElevatedButton(
                                onPressed: _submitForm,
                                style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all<Size>(
                                      const Size(310, 50)),
                                  backgroundColor: MaterialStateProperty.all<
                                          Color>(
                                      const Color.fromRGBO(254, 194, 43, 1)),
                                ),
                                child: const Text(
                                  'Login',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 50.0),
                                child: Image.asset(
                                  'assets/images/or.png',
                                  width: 289,
                                  height: 19,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Image.asset(
                                  'assets/images/google.png',
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegisterScreen()));
                                  },
                                  child: const Text(
                                      "Don't have an account? Register",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black))),
                              const SizedBox(height: 50.0),
                            ],
                          ),
                        ]),
                  ),
                ))));
  }
}
