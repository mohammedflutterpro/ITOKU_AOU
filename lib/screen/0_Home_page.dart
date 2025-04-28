import 'package:flutter/material.dart';
import 'package:toku/screen/2_Family_Members.dart';
import 'package:toku/screen/3_Colors.dart';
import 'package:toku/screen/1_Numbers_Page.dart';
import 'package:toku/screen/4_Phrases.dart';
import 'package:toku/screen/5_food.dart';
import '../model/Category_Item.dart';
import '6_talk_to_me.dart';
import 'Quiz/Quiz.dart';
import 'drawer/ContactTutor.dart';
import 'drawer/HowToUsePage.dart';
import 'drawer/ReportProblemPage.dart';
import 'drawer/about_page.dart';
import 'drawer/suggested_features.dart';

class HomePageToku extends StatelessWidget {
  const HomePageToku({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text('IToku', style: TextStyle(color: Colors.white)),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              color: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'IToku',
                    style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Begin your language journey today and unlock the world of Japanese with fun and easy lessons.',
                    style: TextStyle(fontSize: 14, color: Colors.white,overflow: TextOverflow.ellipsis ),
                    maxLines: 3,
                  ),
                ],
              ),
            ),



            ListTile(
              leading: const Text('❓', style: TextStyle(fontSize: 24),),
              title: const Text('How to Use'),
              onTap: () => _navigateTo(context, HowToUsePage()),
            ),
            ListTile(
              leading: const Text('ℹ️', style: TextStyle(fontSize: 24),),
              title: const Text('App Info'),
              onTap: () => _navigateTo(context, AboutPage()),
            ),
            ListTile(
              leading: const Text('✉️', style: TextStyle(fontSize: 24)), // emoji as icon
              title: const Text('Contact Tutor'),
              onTap: () => _navigateTo(context, ContactTutorPage()),
            ),
            ListTile(
              leading: const Text('📘',style: TextStyle(fontSize: 24),),
              title: const Text('Report Problem'),
                onTap: () => _navigateTo(context, ReportProblemPage()),
            ),
            ListTile(
              leading: const Text('💡',style: TextStyle(fontSize: 24),),
              title: const Text('Suggested feature'),
                onTap: () => _navigateTo(context, SuggestedFeaturesPage()),
            ),
            // ListTile(
            //   leading: const Icon(Icons.info_outline, color: Colors.brown),
            //   title: const Text('About'),
            //   onTap: () => _navigateTo(context, AboutPage()),
            // ),
          ],
        ),
      ),
      body: Column(
        children: [
          CategoryItem(text: 'Number', emoji: '🔢', color: Colors.amber, ontap: () => _navigateTo(context, NumbersPage())),
          CategoryItem(text: 'Family Members', emoji: '👨‍👩‍👧‍👦', color: Colors.green, ontap: () => _navigateTo(context, FamilyMembers())),
          CategoryItem(text: 'Colors', emoji: '🎨', color: Colors.purple, ontap: () => _navigateTo(context, ColorsPage())),
          CategoryItem(text: 'Phrases', emoji: '💬', color: Colors.blue, ontap: () => _navigateTo(context, Phrases())),
          CategoryItem(text: 'Food', emoji: '🍽️', color: Colors.redAccent, ontap: () => _navigateTo(context, Food())),
          CategoryItem(text: 'Quiz', emoji: '📝', color: Colors.orange, ontap: () => _navigateTo(context, QuizPage())),
          CategoryItem(text: 'Talk to me', emoji: '🎤', color: Colors.black, ontap: () => _navigateTo(context, SpeechPage())),
        ],
      ),
    );
  }

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }


}
