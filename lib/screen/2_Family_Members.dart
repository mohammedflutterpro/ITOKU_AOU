import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../data/family_data.dart';

class FamilyMembers extends StatelessWidget {
  FamilyMembers({super.key});

  final FlutterTts flutterTts = FlutterTts();

  void speakJapanese(String text) async {
    try {
      await flutterTts.setLanguage("ja-JP");
      await flutterTts.setSpeechRate(0.5);
      await flutterTts.speak(text);
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: double.maxFinite,
        title: Text(
          'Family Members',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: familyMembers.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      title: Center(
                        child: Text(
                          familyMembers[index]["EnName"]!,
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            familyMembers[index]["image"]!,
                            height: 100,
                          ),
                          SizedBox(height: 10),
                          Text(
                            familyMembers[index]["japName"]!,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                      actions: [
                        // زرار النطق بالياباني
                        TextButton.icon(
                          onPressed: () {
                            speakJapanese(familyMembers[index]["japName"]!);
                          },
                          icon: Icon(Icons.volume_up, color: Colors.green),
                          label: Text(
                            'japanese',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                        // زر الإغلاق
                        TextButton(
                          child: Text(
                            'close',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                width: 100,
                height: 100,
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
