import 'package:flutter/material.dart';
import 'package:food_app/src/controllers/signup_controller.dart';
import 'package:food_app/src/authentication/screens/login.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isHidden = true;
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _submitForm() {}

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xFFFFF7DD),
            foregroundColor: Colors.black,
            elevation: 0.0),
        body: SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: Container(
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
                              'Welcome\nCreate an Account',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(254, 194, 43, 1)),
                            ),
                          ]),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                const SizedBox(height: 50.0),
                                SizedBox(
                                  width: 310,
                                  child: TextFormField(
                                    controller: controller.fullName,
                                    decoration: const InputDecoration(
                                      hintText: 'Enter your full name',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromRGBO(
                                                254, 194, 43, 1)),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                SizedBox(
                                  width: 310,
                                  child: TextFormField(
                                    controller: controller.email,
                                    decoration: const InputDecoration(
                                      hintText: 'Enter your email',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromRGBO(
                                                254, 194, 43, 1)),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                SizedBox(
                                  width: 310,
                                  child: TextFormField(
                                    controller: controller.password,
                                    decoration: InputDecoration(
                                      hintText: 'Enter your password',
                                      border: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromRGBO(
                                                254, 194, 43, 1)),
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
                                const SizedBox(height: 20.0),
                                SizedBox(
                                  width: 310,
                                  child: TextFormField(
                                    controller: controller.confirmpassword,
                                    decoration: InputDecoration(
                                      hintText: 'Confirm your password',
                                      border: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromRGBO(
                                                254, 194, 43, 1)),
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
                                const SizedBox(height: 20.0),
                                Container(
                                    child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      SignUpController.instance.registerUser(
                                          controller.email.text.trim(),
                                          controller.password.text.trim());
                                    }
                                  },
                                  style: ButtonStyle(
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(
                                            const Size(310, 50)),
                                    backgroundColor: MaterialStateProperty.all<
                                            Color>(
                                        const Color.fromRGBO(254, 194, 43, 1)),
                                  ),
                                  child: const Text('Register',
                                      style: TextStyle(fontSize: 16)),
                                )),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 50.0),
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
                                                  LoginScreen()));
                                    },
                                    child: const Text(
                                        "Already have an account? Login",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black))),
                                const SizedBox(height: 50.0),
                              ],
                            ),
                          )
                        ]),
                  ),
                ))));
  }
}
