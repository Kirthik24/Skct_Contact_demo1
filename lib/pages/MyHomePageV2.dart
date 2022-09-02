import 'package:flutter/material.dart';

import 'ContactPage.dart';

class MyHomePageV2 extends StatefulWidget {
  const MyHomePageV2({Key? key}) : super(key: key);

  @override
  State<MyHomePageV2> createState() => _MyHomePageV2State();
}

class _MyHomePageV2State extends State<MyHomePageV2> {
  final List<String> depList = ["OFFICE","CIVIL", "CSE", "ECE","EEE", "ICE", "IT", "L&D","MBA","MECH","S&H","PHY EDU"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Skct-Contacts"),
        centerTitle: true,
      ),
      body: Column(
        children: [
        Text("Skct Contacts"),
        Spacer(),
        Center(
          child:Container(
            height: 500,

            child: ListView.builder(
              itemCount: depList.length,
              itemBuilder: (context,index) => Card(
                elevation: 6,
                margin: const EdgeInsets.all(10),
                child: ListTile(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.blue.shade200, width: 0.5),
                        borderRadius: BorderRadius.circular(5)),
                    tileColor: Colors.blue.shade400,
                    textColor: Colors.white,
                    iconColor: Colors.white,
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
          ) ,
        )
        ],
      ),
    );
  }
}
