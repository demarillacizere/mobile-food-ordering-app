import 'package:flutter/material.dart';
import 'package:food_app/src/authentication/screens/register.dart';
import 'package:food_app/reset_password.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({Key? key}) : super(key: key);
  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final TextEditingController _emailController = TextEditingController();

  void _submitForm() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFFFF7DD),
          foregroundColor: Colors.black,
          elevation: 0.0,
        ),
        body: Container(
          color: const Color(0xFFFFF7DD),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
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
                      'Forgot Password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(254, 194, 43, 1)),
                    ),
                    const Text(
                      'Enter your email and we will send you a reset instruction',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(254, 194, 43, 1)),
                    ),
                  ]),
                  Column(
                    children: [
                      SizedBox(
                        width: 310,
                        child: TextField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            hintText: 'Email Address',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(254, 194, 43, 1)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        // onPressed: _submitForm,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ResetScreen()));
                        },
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all<Size>(
                              const Size(210, 50)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromRGBO(254, 194, 43, 1)),
                        ),
                        child: const Text(
                          'Reset Password',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(0, 0, 0, 1)),
                        ),
                      ),
                      const SizedBox(height: 50.0),
                    ],
                  ),
                ]),
          ),
        ));
  }
}
