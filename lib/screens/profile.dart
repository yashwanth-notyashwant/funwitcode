import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var hi = MediaQuery.of(context).size.height;
    var wi = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: BackButton(
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: wi,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, top: 30),
                  child: const Text(
                    'Profile :',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w800),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, top: 30),
                  child: const Text(
                    'Name :',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
                  child: Text(
                    "thisisnmae",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, top: 10),
                  child: const Text(
                    'Mail id :',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
                  child: Text(
                    "this is mail.id",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, top: 10),
                  child: const Text(
                    'Score:',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
                  child: Text(
                    "this is score ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
