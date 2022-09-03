import 'package:contact_demo2/pages/MyHomePageV2.dart';
import 'package:contact_demo2/pages/SigninPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  pageswitcher(){
    if(FirebaseAuth.instance.currentUser != null){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePageV2()),
      );
    }else{
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SigninPage()),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    pageswitcher();
    return const MaterialApp(

    );
  }
}
