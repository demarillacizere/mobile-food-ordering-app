import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/firebase_options.dart';
import 'package:food_app/src/authentication/screens/register.dart';
import 'package:food_app/src/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository));
  await Firebase.initializeApp();
  Get.put(AuthenticationRepository());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chap Chap Delivery',
      theme: ThemeData(
          // primarySwatch: Color(0xFFfff7dd),
          ),
      home: const MyLandingPage(),
    );
  }
}

class MyLandingPage extends StatefulWidget {
  const MyLandingPage({super.key});

  @override
  State<MyLandingPage> createState() => _MyLandingPage();
}

class _MyLandingPage extends State<MyLandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          'assets/images/logo.png',
                          width: 65,
                          height: 65,
                        ),
                      ),
                      const Text(
                        'Chap Chap\nDelivery',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ]),
                    Image.asset(
                      'assets/images/home_icon.png',
                      width: 330,
                      height: 252,
                    ),
                    Column(children: const [
                      Padding(
                        padding: EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          'Welcome',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        'We are excited to feed you\nShall we get started?',
                        textAlign: TextAlign.center,
                      ),
                    ]),
                    ElevatedButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all<Size>(
                              const Size(250, 50)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromRGBO(254, 194, 43, 1)),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen()));
                        },
                        child: const Text("GET STARTED",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w800))),
                  ]),
            )));
  }
}
