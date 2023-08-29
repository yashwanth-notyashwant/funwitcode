import 'dart:core';
import 'package:flutter/material.dart';

import '../screens/python_chapters.dart';

// ignore: must_be_immutable
class CardForPost extends StatefulWidget {
  @override
  State<CardForPost> createState() => _CardForPostState();
}

class _CardForPostState extends State<CardForPost> {
  @override
  Widget build(BuildContext context) {
    // var hi = MediaQuery.of(context).size.height;
    var wi = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PythonChaptersListScreen()),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        width: wi * 0.95,
        height: 260,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Color.fromARGB(255, 240, 244, 244),
        ),
        child: Card(
          color: Colors.grey.shade100,
          // disables color
          // color: Colors.grey.shade300,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.asset(
            './lib/assets/python_image.png',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
