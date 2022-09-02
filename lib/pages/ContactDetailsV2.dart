import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/ContactClass.dart';


class ContactDetailsV2 extends StatelessWidget {
  final ContactClass contact;
  const ContactDetailsV2({
    Key? key,
    required this.contact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    // appBar: AppBar(
    //   title: Text(contact.name),
    // ),
    body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(contact.name,
        style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 30.0,
                fontWeight: FontWeight.w400,
                color: Colors.black),
              ),
            ),


          Text(contact.des,
            style: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
                color: Colors.grey),
          ),

          const SizedBox(
            width: 150.0,
            height: 20.0,
            child: Divider(
              color: Colors.grey,
            ),
          ),

      Card(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
        child: ListTile(
          leading: const Icon(
            Icons.account_balance_outlined,
            color: Colors.blue,
          ),
          title: Text(
            "${contact.department} Department",
            style: TextStyle(
                fontSize: 18.0,
                fontFamily: 'Source Sans Pro',
                color: Colors.teal.shade900),
          ),
        ),
      ),
      Card(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
        child: ListTile(
          leading: const Icon(
            Icons.email,
            color: Colors.blue,
          ),
          title: Text(
            contact.email,
            style: TextStyle(
                fontFamily: 'Source Sans Pro',
                fontSize: 18.0,
                color: Colors.teal.shade900),
          ),
        ),
      ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            child: ListTile(
              leading: const Icon(
                Icons.phone,
                color: Colors.blue,
              ),
              title: Text(
                contact.phone,
                style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    fontSize: 18.0,
                    color: Colors.teal.shade900),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: Container(
              width: 300.0,
              height: 50.0,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(colors: [Color(0xFF0061ff), Color(0xFF60efff)])),
              child: ElevatedButton.icon(
                onPressed: () async{
                  // Respond to button press
                  final Uri url = Uri.parse('tel://${contact.phone}');
                  launchUrl(url);
                },
                style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                icon: const Icon(Icons.copy, size: 20),
                label: const Text("Copy to Dialer"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: Container(
              width: 300.0,
              height: 50.0,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(colors: [Color(0xFF38b000), Color(0xFFccff33)])),
              child: ElevatedButton.icon(
                onPressed: () async{
                  await FlutterPhoneDirectCaller.callNumber(contact.phone);
                },
                style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                  icon: const Icon(Icons.phone_forwarded, size: 20),
                  label: const Text("Call"),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: Container(
              width: 300.0,
              height: 50.0,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(colors: [Color(0xFFd02224), Color(0xFFf1a7a9)])),
              child: ElevatedButton.icon(
                onPressed: () async{
                  final Uri mail = Uri.parse('mailto:${contact.email}');
                  launchUrl(mail);
                },
                style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                icon: const Icon(Icons.mail_outline, size: 20),
                label: const Text("Mail"),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
