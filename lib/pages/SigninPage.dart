import 'package:contact_demo2/pages/MyHomePageV2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: ElevatedButton(
  //         child: const Text("Google SignIn"),
  //         onPressed: (){
  //          Future<UserCredential> user = signInWithGoogle();
  //          Navigator.push(
  //            context,
  //            MaterialPageRoute(builder: (context) => const MyHomePageV2()),
  //          );
  //
  //         },
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/welcome-one.png"),
            fit: BoxFit.cover
          )
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 150,left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:const [
              Text("SKCT",
              style: TextStyle(
                color: Colors.black,
                fontSize: 33,
                fontWeight: FontWeight.w600,
              ),
              ),

              Text("Contacts",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 31,
                  fontWeight: FontWeight.w300,
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: 250,
                  child: Text
                    ('''Welcome to Skct Contacts !!!
Please login with your Official mail ID to continue.''',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                          height: 1.3,
                          fontWeight: FontWeight.w500
                    ),

                    ),
                ),
              ),


            ]
          ),
        ),
      ),
    );
  }



}
