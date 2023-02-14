import 'package:flutter/material.dart';
import 'package:food_app/register.dart';

class ForgotScreen extends StatefulWidget {
  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  bool _isHidden = true;
  final TextEditingController _emailController = TextEditingController();

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _submitForm() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          const SizedBox(height: 70.0),
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
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 50.0),
                            child: Column(
                              children: [
                                const SizedBox(height: 50.0),
                                TextField(
                                  controller: _emailController,
                                  decoration: const InputDecoration(
                                    hintText: 'Email Address',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(254, 194, 43, 1)),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                const SizedBox(height: 40.0),
                                ElevatedButton(
                                  onPressed: _submitForm,
                                  style: ButtonStyle(
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(
                                            const Size(240, 50)),
                                    backgroundColor: MaterialStateProperty.all<
                                            Color>(
                                        const Color.fromRGBO(254, 194, 43, 1)),
                                  ),
                                  child: const Text('Reset Password',
                                  style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(0, 0, 0, 1)),),
                                ),
                                
                                
                                
                                const SizedBox(height: 50.0),
                              ],
                            ),
                          ),
                        ]),
                  ),
                ))));
  }
}




