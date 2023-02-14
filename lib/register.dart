import 'package:flutter/material.dart';
import 'package:food_app/login.dart';

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
  void _submitForm() {
    // Handle form submission here
    // ...
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child:Container(
      color: const Color(0xFFFFF7DD),
      child: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              children: [
                const SizedBox(height: 50.0),
                TextField(
                  controller: _fullNameController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your full name',
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(254, 194, 43, 1)),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(254, 194, 43, 1)),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    border: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(254, 194, 43, 1)),
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
                const SizedBox(height: 20.0),
                TextField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    hintText: 'Confirm your password',
                    border: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(254, 194, 43, 1)),
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

                const SizedBox(height: 20.0),
                Container(
                  
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: ButtonStyle(
                          minimumSize:
                              MaterialStateProperty.all<Size>(const Size(310, 50)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromRGBO(254, 194, 43, 1)),
                        ),
                    child: const Text('Submit'),
                  )),

                Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
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

                ElevatedButton(
                        style:  const ButtonStyle(
                          
                          
                          
                          
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: const Text("Already have an account? Login",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black))),
            ],
            ),
          ),
        ]),
      ),
    )));
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
