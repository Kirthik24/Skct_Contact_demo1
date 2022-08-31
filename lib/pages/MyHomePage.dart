import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ContactPage.dart';

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
