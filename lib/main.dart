import 'package:contact_demo2/pages/MyHomePageV2.dart';
import 'package:contact_demo2/pages/SigninPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:splashscreen/splashscreen.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}



class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    User? firebaseUser = FirebaseAuth.instance.currentUser;
// Define a widget
    Widget firstWidget;

// Assign widget based on availability of currentUser
    if (firebaseUser != null) {
      firstWidget = const MyHomePageV2();
    } else {
      firstWidget = const SigninPage();
    }

// Run the app with appropriate screen
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contacts',
      home: SplashScreen(
          seconds: 2,
          navigateAfterSeconds:SigninPage(),
          title: const Text(
            'SKCT Contacts',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'SFProDisplay',
                fontSize: 20.0,
                color: Colors.black),
          ),
          image: Image.asset('assets/skctpng.png'),
          photoSize: 100.0,
          backgroundColor: Colors.white,
          styleTextUnderTheLoader: const TextStyle(),
          loaderColor: Colors.blue
      ),
    );
  }
}









