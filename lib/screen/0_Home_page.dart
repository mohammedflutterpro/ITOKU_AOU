import 'package:flutter/material.dart';
import 'package:toku/screen/2_Family_Members.dart';
import 'package:toku/screen/3_Colors.dart';
import 'package:toku/screen/1_Numbers_Page.dart';
import 'package:toku/screen/4_Phrases.dart';
import 'package:toku/screen/5_food.dart';
import 'package:toku/screen/Quiz/Quiz.dart';
import 'package:toku/screen/6_talk_to_me.dart';
import 'package:toku/screen/7_new_lessons.dart';
import '../model/Category_Item.dart';
import 'drawer/custom_drawer.dart';

class HomePageToku extends StatelessWidget {
  const HomePageToku({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('IToku', style: TextStyle(color: Colors.white)),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.circle_notifications_rounded,
                    color: Colors.white, size: 28),
                onPressed: () => _showNotifications(context),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.red, width: 1),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: const Text(
                    '3',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          CategoryItem(text: 'Number', emoji: '🔢', color: Colors.amber, ontap: () => _navigateTo(context, NumbersPage())),
          CategoryItem(text: 'Family Members', emoji: '👨‍👩‍👧‍👦', color: Colors.green, ontap: () => _navigateTo(context, FamilyMembers())),
          CategoryItem(text: 'Colors', emoji: '🎨', color: Colors.purple, ontap: () => _navigateTo(context, ColorsPage())),
          CategoryItem(text: 'Phrases', emoji: '💬', color: Colors.blue, ontap: () => _navigateTo(context, Phrases())),
          CategoryItem(text: 'Food', emoji: '🍽️', color: Colors.redAccent, ontap: () => _navigateTo(context, Food())),
          CategoryItem(text: 'Quiz', emoji: '📝', color: Colors.orange, ontap: () => _navigateTo(context, QuizPage())),
          CategoryItem(text: 'New lessons', emoji: '🎯', color: Colors.indigo, ontap: () => _navigateTo(context, NewLessonsPage())),
          CategoryItem(text: 'Talk to me', emoji: '🎤', color: Colors.black, ontap: () => _navigateTo(context, SpeechPage())),
        ],
      ),
    );
  }

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  void _showNotifications(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height * 0.7,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Notifications',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const Divider(thickness: 1),
              Expanded(
                child: ListView(
                  children: [
                    _buildNotificationItem(
                      icon: Icons.celebration,
                      title: "New lesson available!",
                      subtitle: "Japanese Phrases 101",
                      time: "2 hours ago",
                      color: Colors.blue,
                    ),
                    _buildNotificationItem(
                      icon: Icons.book,
                      title: "Practice reminder",
                      subtitle: "There is a new questions added",
                      time: "1 day ago",
                      color: Colors.green,
                    ),
                    _buildNotificationItem(
                      icon: Icons.star,
                      title: "Achievement!",
                      subtitle: "You completed 10 lessons this week",
                      time: "3 days ago",
                      color: Colors.amber,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                child: const Text('Mark all as read'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNotificationItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String time,
    required Color color,
  }) {
    return Builder(
      builder: (context) => ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        onTap: () {
          if (title.toLowerCase().contains('lesson')) {
            _navigateTo(context, NewLessonsPage());
          } else if (title.toLowerCase().contains('practice')) {
            _navigateTo(context, QuizPage());
          }
        },
      ),
    );
  }
}
