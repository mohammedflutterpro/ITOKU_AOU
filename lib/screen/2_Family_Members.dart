import 'dart:math';
import 'package:flutter/material.dart';
import '../data/family_members_data.dart';  // Import your family members data
import '../services/flutter_tts_service.dart';  // Import your TTS service for audio
import '../services/translation.dart';  // Import the translation service

class FamilyMembers extends StatelessWidget {
  const FamilyMembers({Key? key}) : super(key: key);

  void _playTranslationAudio(String japName) {
    speakInJapanese(japName);
  }

  void _playEnglishAudio(String enName) {
    speakInEnglish(enName);
  }


  void _showQuizDialog(BuildContext context) {
    final randomFamilyMember = familyMembers[Random().nextInt(familyMembers.length)];
    final enName = randomFamilyMember["EnName"]!;
    final japName = randomFamilyMember["japName"] ?? "Unknown";

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Center(
          child: Text(
            "Family Member Quiz",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Who is this family member?", style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Text(
              enName,  // Displaying the name in Romaji
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.translate),
              label: Text("Reveal Answer"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                speakInJapanese(japName);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Answer: $japName")),
                );
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            child: Text("Close", style: TextStyle(color: Colors.green)),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  // Function to show the family member info when tapped
  void _showFamilyMemberInfo(BuildContext context, int index) async {
    final familyMember = familyMembers[index];
    final enName = familyMember["EnName"]!;
    final japName = familyMember["japName"] ?? await translateToJapanese(enName);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Center(
            child: Text(
              enName,
              style: TextStyle(fontSize: 30),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Display the Japanese name
              Text(
                japName,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              // Button to play the Japanese translation audio
              ElevatedButton.icon(
                onPressed: () {
                  _playTranslationAudio(japName);  // Play the Japanese translation audio
                },
                icon: Icon(Icons.volume_up),
                label: Text('$japName'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              // Button to play the English audio
              ElevatedButton.icon(
                onPressed: () {
                  _playEnglishAudio(enName);  // Play the English audio
                },
                icon: Icon(Icons.volume_up),
                label: Text('$enName'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Family Members',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.quiz, color: Colors.white),
            onPressed: () => _showQuizDialog(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Adjust the number of columns
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: familyMembers.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => _showFamilyMemberInfo(context, index),
              child: Container(
                width: 100, // Fixed width for square shape
                height: 100, // Fixed height for square shape
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: Text(
                  textAlign: TextAlign.center,
                  familyMembers[index]["EnName"]!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}