import 'package:flutter/material.dart';
import 'package:toku/screen/drawer/suggested_features.dart';
import 'ContactTutor.dart';
import 'HowToUsePage.dart';
import 'ReportProblemPage.dart';
import 'about_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                  style: TextStyle(fontSize: 14, color: Colors.white, overflow: TextOverflow.ellipsis),
                  maxLines: 3,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Text('❓', style: TextStyle(fontSize: 24)),
            title: const Text('How to Use'),
            onTap: () => _navigateTo(context, HowToUsePage()),
          ),
          ListTile(
            leading: const Text('📱', style: TextStyle(fontSize: 24)),
            title: const Text('App Info'),
            onTap: () => _navigateTo(context, AboutPage()),
          ),
          ListTile(
            leading: const Text('✉️', style: TextStyle(fontSize: 24)),
            title: const Text('Contact Tutor'),
            onTap: () => _navigateTo(context, ContactTutorPage()),
          ),
          ListTile(
            leading: const Text('⚠️', style: TextStyle(fontSize: 24)),
            title: const Text('Report Problem'),
            onTap: () => _navigateTo(context, ReportProblemPage()),
          ),
          ListTile(
            leading: const Text('💡', style: TextStyle(fontSize: 24)),
            title: const Text('Suggested feature'),
            onTap: () => _navigateTo(context, SuggestedFeaturesPage()),
          ),
        ],
      ),
    );
  }

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }
}
