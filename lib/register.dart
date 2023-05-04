import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/login.dart';

import 'home_page.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  bool _isHidden = true;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _secondNameController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _submitForm() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    // final isValid = _formKey.currentState!.validate();
    // if (isValid) {
    //   try {
    await _auth.createUserWithEmailAndPassword(
        email: _emailTextController.text.trim(),
        password: _passwordTextController.text.trim());

    final User user = _auth.currentUser!;
    final _uid = user.uid;
    await FirebaseFirestore.instance.collection('users').doc(_uid).set({
      'uid': _uid,
      'firstName': _firstNameController.text.trim(),
      'secondName': _secondNameController.text.trim(),
      'email': _emailTextController.text.trim(),
      'password': _passwordTextController.text.trim(),
    });
    // }
    // catch (e) {
    //   print(e);
    // }
    // }
  }

  // @override
  // Future signUp() async {
  //   await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: _emailController.text.trim(),
  //       password: _passwordController.text.trim());
  //   addUserDetails(
  //     _firstNameController.text.trim(),
  //     _secondNameController.text.trim(),
  //     _emailController.text.trim(),
  //     _passwordController.text.trim(),
  //   );
  // }

  // Future addUserDetails(String firstName, String secondName, String email,
  //     String password) async {
  //   await FirebaseFirestore.instance.collection('users').add({
  //     'firstName': firstName,
  //     'secondName': secondName,
  //     'email': email,
  //     'password': password,
  //   });
  // }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFF7DD),
        // appBar: AppBar(
        //     backgroundColor: const Color(0xFFFFF7DD),
        //     foregroundColor: Colors.black,
        //     elevation: 0.0),
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
                          Column(
                            children: [
                              const SizedBox(height: 50.0),
                              SizedBox(
                                width: 310,
                                child: TextField(
                                  key: ValueKey('firstNameField'),
                                  controller: _firstNameController,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter first name',
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
                                  key: ValueKey('SecondNameField'),
                                  controller: _secondNameController,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter second name',
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
                                  key: ValueKey('EmailField'),
                                  controller: _emailTextController,
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
                                  key: ValueKey('Password'),
                                  controller: _passwordTextController,
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
                              const SizedBox(height: 20.0),
                              SizedBox(
                                width: 310,
                                child: TextField(
                                  key: ValueKey('ConfirmPassword'),
                                  controller: _confirmPasswordController,
                                  decoration: InputDecoration(
                                    hintText: 'Confirm your password',
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
                              const SizedBox(height: 20.0),
                              Container(
                                  child: ElevatedButton(
                                onPressed: () {
                                  _submitForm();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyHomePage()));
                                },
                                style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all<Size>(
                                      const Size(310, 50)),
                                  backgroundColor: MaterialStateProperty.all<
                                          Color>(
                                      const Color.fromRGBO(254, 194, 43, 1)),
                                ),
                                child: const Text('Register',
                                    style: TextStyle(fontSize: 16)),
                              )),
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
                                                const LoginScreen()));
                                  },
                                  child: const Text(
                                      "Already have an account? Login",
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
