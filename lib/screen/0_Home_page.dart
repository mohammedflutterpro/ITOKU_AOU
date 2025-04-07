import 'package:flutter/material.dart';
import 'package:toku/Compononets/Category_Item.dart';
import 'package:toku/screen/1_Numbers_Page.dart';
import 'package:toku/screen/3_Colors.dart';
import 'package:toku/screen/4_Phrases.dart';
import 'package:toku/screen/Quiz/Quiz.dart';
import '2_Family_Members.dart';
import '5_food.dart';


class HomePage_Toku extends StatelessWidget {
  const HomePage_Toku({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(
          'Toku',
          style:TextStyle(
              color:Colors.white
          ),
        ),
      ),
      body: Column(
        children: [
          Category(
            text: 'Number',
            emoji: '🔢', // Emoji for Numbers
            color: Colors.amber,
            ontap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return NumbersPage();
              }));
            },
          ),
          Category(
            text: 'Family Members',
            emoji: '👨‍👩‍👧‍👦', // Emoji for Family Members
            color: Colors.green,
            ontap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FamilyMembers();
              }));
            },
          ),
          Category(
            text: 'Colors',
            emoji: '🎨', // Emoji for Colors
            color: Colors.purple,
            ontap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ColorsPage();
              }));
            },
          ),
          Category(
            text: 'Phrases',
            emoji: '💬', // Emoji for Phrases
            color: Colors.blue,
            ontap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Phrases();
              }));
            },
          ),
          Category(
            text: 'Food', // Added a new category for Quiz
            emoji: '🍽️', // Emoji for Quiz
            color: Colors.redAccent,
            ontap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return food(); // Navigate to the QuizPage
              }));
            },
          ),
          Category(
            text: 'Quiz', // Added a new category for Quiz
            emoji: '📝', // Emoji for Quiz
            color: Colors.orange,
            ontap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return QuizPage(); // Navigate to the QuizPage
              }));
            },
          ),
        ],
      ),
    );
  }
}

