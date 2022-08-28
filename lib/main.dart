import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class ContactClass{
  final String name;
  final String department;
  final String phone;


  const ContactClass({
    required this.name,
    required this.department,
    required this.phone,
  });

  static ContactClass fromJson(json) => ContactClass(
      name: json['name'],
      department: json['department'],
      phone: json['phone']);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'skct'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> depList = ["cse", "it", "ece", "mech"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: depList.length,
          itemBuilder: (context,index) => Card(
            elevation: 6,
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Center(
                child: Text(depList[index].toString()),
              ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ContactPage(destination: depList[index].toString())),

                  );
              }
            ),
          ),
        ),
      )
    );

  }
}


class ContactPage extends StatefulWidget {
  final String destination;

  const ContactPage({Key? key, required this.destination}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  late Future<List<ContactClass>> contactsFuture;

  @override
  void initState(){
    super.initState();

    contactsFuture = getContacts(context);
  }



   Future<List<ContactClass>> getContacts(BuildContext context) async{
      final assetBundle = DefaultAssetBundle.of(context);
      final String address = 'assets/${widget.destination}.json';
      final data = await assetBundle.loadString(address);

      final body = json.decode(data);
      return body.map<ContactClass>(ContactClass.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Contacts List'),
      centerTitle: true,
    ),
    body: Center(
      child: FutureBuilder<List<ContactClass>>(
        future:  contactsFuture,
        builder: (context, snapshot){
          if(snapshot.hasData){
            final contacts = snapshot.data!;
            return buildContacts(contacts);
          }else{
            return Text('assets/${widget.destination}.json');
          }
        },
      )
    ),
  );

  Widget buildContacts(List<ContactClass> contacts) => ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        final thiscontact = contacts[index];

        return Card(
          child: ListTile(
            title: Text(thiscontact.name),
            subtitle: Text(thiscontact.department),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute
                (builder: (context) => ContactDetails(contact: thiscontact),
              ));
            },
          ),
        );

      },
  );
}

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
      child: Text(contact.phone),
    ),
  );
}


