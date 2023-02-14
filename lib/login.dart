import 'package:flutter/material.dart';
import 'package:food_app/register.dart';

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
                              'Welcome Back\nLog into account',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 24,
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
                                    hintText: 'Enter your email',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(254, 194, 43, 1)),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                TextField(
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
                                const SizedBox(height: 10.0),
                                Row(
                                  children: const [
                                    Text("Forgot Password",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(fontSize: 16)),
                                  ],
                                ),
                                const SizedBox(height: 20.0),
                                ElevatedButton(
                                  onPressed: _submitForm,
                                  style: ButtonStyle(
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(
                                            const Size(310, 50)),
                                    backgroundColor: MaterialStateProperty.all<
                                            Color>(
                                        const Color.fromRGBO(254, 194, 43, 1)),
                                  ),
                                  child: const Text('Login'),
                                ),
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
                                                  RegisterScreen()));
                                    },
                                    child: const Text(
                                        "Don't have an account? Register",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black))),
                                const SizedBox(height: 50.0),
                              ],
                            ),
                          ),
                        ]),
                  ),
                ))));
  }
}






        // body: Container(
        //     color: const Color(0xFFFFF7DD),
        //     child: Center(
        //       child: Column(
        //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //           children: [
        //             Column(children: [
        //               Padding(
        //                 padding: const EdgeInsets.only(bottom: 16.0),
        //                 child: Image.asset(
        //                   'assets/images/user.png',
        //                   width: 130,
        //                   height: 130,
        //                 ),
        //               ),
        //               const Text(
        //                 'Welcome\nCreate an Account',
        //                 textAlign: TextAlign.center,
        //                 style: TextStyle(
        //                     fontSize: 24,
        //                     fontWeight: FontWeight.w600,
        //                     color: Color.fromRGBO(254, 194, 43, 1)),
        //               ),
        //             ]),
        //             Column(children: const [
        //               Padding(
        //                 padding: EdgeInsets.only(bottom: 16.0),
        //                 child: Text(
        //                   'Welcome',
        //                   style: TextStyle(
        //                     fontSize: 24,
        //                     fontWeight: FontWeight.bold,
        //                   ),
        //                 ),
        //               ),
        //               Text(
        //                 'We are excited to feed you\nShall we get started?',
        //                 textAlign: TextAlign.center,
        //               ),
        //             ]),
        //             ElevatedButton(
        //                 style: ButtonStyle(
        //                   minimumSize: MaterialStateProperty.all<Size>(
        //                       const Size(250, 50)),
        //                   backgroundColor: MaterialStateProperty.all<Color>(
        //                       const Color.fromRGBO(254, 194, 43, 1)),
        //                 ),
        //                 onPressed: () {
        //                   Navigator.push(
        //                       context,
        //                       MaterialPageRoute(
        //                           builder: (context) => LoginScreen()));
        //                 },
        //                 child: const Text("GET STARTED",
        //                     style:
        //                         TextStyle(fontSize: 18, color: Colors.black))),
        //           ]),
        //     ))
        // );
//   }
// }


