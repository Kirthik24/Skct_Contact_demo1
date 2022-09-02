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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 25, 15, 15),
        child: Column(
          children: [
            Container(
              height: 150,
              child: Row(
                children: [
                  Container(
                    width:130,
                      child: Image.asset('assets/skctpng.png')),
                  const Expanded(
                      child:Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Sri Krishna College of Technology",
                    style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 17.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                  ),
                      ) )
                ],
              ),
            ),
            const SizedBox(
              width: 150.0,
              height: 10.0,
              child: Divider(
                color: Colors.grey,
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 10, 8,10),
              child: Text("DEPARTMENTS",
                  style: TextStyle(
                      fontSize: 16.0,
                      letterSpacing: 0.5,
                      color: Colors.black)),
            ),
            Expanded(
                child: ListView.builder(
                  itemCount: depList.length,
                  itemBuilder: (context,index) => Card(
                    elevation: 6,
                    margin: const EdgeInsets.fromLTRB(15, 10, 15,10),
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
          ],
        ),
      ),
    );
  }
}
