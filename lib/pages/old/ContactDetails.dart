import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/ContactClass.dart';

class ContactDetails extends StatelessWidget {
  final ContactClass contact;
  const ContactDetails({
    Key? key,
    required this.contact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(contact.name),
    ),
    body: Center(
        child: Card(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(contact.name),
                Text(contact.phone),
                ElevatedButton(
                  child: Text('Copy to Dailer'),
                  onPressed: () async{
                    launch('tel://${contact.phone}');
                  },
                ),
                ElevatedButton(
                  child: Text('Direct Call'),
                  onPressed: () async{
                    await FlutterPhoneDirectCaller.callNumber(contact.phone);
                  },
                )

              ]
          ),
        )
    ),
  );
}
