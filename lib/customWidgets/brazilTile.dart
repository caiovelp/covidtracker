// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class BrazilTile extends StatelessWidget {
  final String info;
  final int data;
  final Color tileColor;

  BrazilTile(this.info, this.data, this.tileColor);


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: tileColor,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: height * 0.02, horizontal: width * 0.04),
        width: width * 0.45,
        height: height * 0.13,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
                "COVID-19",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15
                ),
            ),
            SizedBox(height: height * 0.007),
            Text(
                info,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: height * 0.02
              ),
            ),
            Text(
              "$data casos",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: height * 0.02
              ),
            )
          ],
        ),
      ),
    );
  }
}
