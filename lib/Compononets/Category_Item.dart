import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  Category({this.color, this.text, this.ontap, this.emoji}); // Add emoji parameter

  String? text;
  Color? color;
  Function()? ontap;
  String? emoji; // Add this line to accept an emoji

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 16),
        height: 70,
        width: double.infinity,
        color: color,
        child: Row(
          children: [
            if (emoji != null) Text(emoji!, style: TextStyle(fontSize: 24)), // Display emoji if provided
            SizedBox(width: 10), // Add some spacing between the emoji and text
            Text(
              text!,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}