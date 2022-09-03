import 'package:contact_demo2/pages/MyHomePageV2.dart';
import 'package:contact_demo2/pages/SigninPage.dart';
import 'package:contact_demo2/pages/SplashScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

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
      firstWidget = MyHomePageV2();
    } else {
      firstWidget = SigninPage();
    }

// Run the app with appropriate screen
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contacts',
      home: firstWidget,
    );
  }
}









