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
    backgroundColor: Colors.teal,
    // appBar: AppBar(
    //   title: Text(contact.name),
    // ),
    body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(contact.name,
        style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 30.0,
            fontWeight: FontWeight.w400,
            color: Colors.white),
          ),

          Text(contact.des,
            style: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
                color: Colors.white),
          ),

          SizedBox(
            width: 150.0,
            height: 20.0,
            child: Divider(
              color: Colors.teal.shade100,
            ),
          ),

      Card(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
        child: ListTile(
          leading: const Icon(
            Icons.account_balance_outlined,
            color: Colors.teal,
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
            color: Colors.teal,
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
                color: Colors.teal,
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
          ElevatedButton.icon(
            onPressed: () async{
              // Respond to button press
              launch('tel://${contact.phone}');
            },
            icon: Icon(Icons.copy, size: 18),
            label: Text("Copy to Dailer"),

          ),
          ElevatedButton.icon(
            onPressed: () async{
              await FlutterPhoneDirectCaller.callNumber(contact.phone);
            },
            icon: Icon(Icons.phone_forwarded, size: 18),
            label: Text("Call"),

          ),



        ],
      ),
    ),
  );
}
