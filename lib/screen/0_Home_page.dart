import 'package:flutter/material.dart';
import 'package:toku/screen/2_Family_Members.dart';
import 'package:toku/screen/3_Colors.dart';
import 'package:toku/screen/1_Numbers_Page.dart';
import 'package:toku/screen/4_Phrases.dart';
import 'package:toku/screen/5_food.dart';
import '../model/Category_Item.dart';
import '6_MicButton.dart';
import 'Quiz/Quiz.dart';
import 'drawer/ContactTutor.dart';
import 'drawer/HowToUsePage.dart';
import 'drawer/ReportProblemPage.dart';
import 'drawer/about_page.dart';

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
            DrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFFCC3D3D)),
              child: const Text(
                'IToku Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info_outline, color: Colors.brown),
              title: const Text('About'),
              onTap: () => _navigateTo(context, AboutPage()),
            ),
            ListTile(
              leading: const Icon(Icons.help_outline, color: Color(0xFFCC3D3D)),
              title: const Text('How to Use'),
              onTap: () => _navigateTo(context, HowToUsePage()),
            ),
            ListTile(
              leading: const Icon(Icons.info_outlined, color: Colors.brown),
              title: const Text('App Info'),
              onTap: () => _navigateTo(context, AboutPage()),
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail, color: Colors.brown),
              title: const Text('Contact Tutor'),
              onTap: () => _navigateTo(context, ContactTutorPage()),
            ),
            ListTile(
              leading: const Icon(Icons.report_problem, color: Colors.brown),
              title: const Text('Report Problem'),
                onTap: () => _navigateTo(context, ReportProblemPage()),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          CategoryItem(text: 'Number', emoji: '🔢', color: Colors.amber, ontap: () => _navigateTo(context, NumbersPage())),
          CategoryItem(text: 'Family Members', emoji: '👨‍👩‍👧‍👦', color: Colors.green, ontap: () => _navigateTo(context, FamilyMembers())),
          CategoryItem(text: 'Colors', emoji: '🎨', color: Colors.purple, ontap: () => _navigateTo(context, ColorsPage())),
          CategoryItem(text: 'Phrases', emoji: '💬', color: Colors.blue, ontap: () => _navigateTo(context, Phrases())),
          CategoryItem(text: 'Food', emoji: '🍽️', color: Colors.redAccent, ontap: () => _navigateTo(context, food())),
          CategoryItem(text: 'Quiz', emoji: '📝', color: Colors.orange, ontap: () => _navigateTo(context, QuizPage())),
          CategoryItem(text: 'Talk to me', emoji: '🎤', color: Colors.black, ontap: () => _navigateTo(context, SpeechPage())),
        ],
      ),
    );
  }

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  void _showInfoDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
