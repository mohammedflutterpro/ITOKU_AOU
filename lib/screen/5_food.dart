import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';  // إضافة المكتبة
import 'package:toku/Compononets/Info_widget.dart';
import 'package:toku/model/inner_data.dart';
import '../data/food_data.dart';

class Food extends StatelessWidget {
   Food();

  final FlutterTts _flutterTts = FlutterTts();  // إضافة المتغير الخاص بالنطق الصوتي

  void _speakInJapanese(String text) async {
    await _flutterTts.setLanguage("ja-JP");
    await _flutterTts.setSpeechRate(0.5);
    await _flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Food',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, // Number of columns in the grid
            mainAxisSpacing: 10,
            mainAxisExtent: 100,
          ),
          itemCount: foodData.length,
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
                          foodData[index]["EnName"]!,
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Display the color
                          SizedBox(height: 10),
                          // Display the Japanese name (romaji)
                          Text(
                            foodData[index]["japName"]!, // Romaji name
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: 10),
                          // Display sound file path (optional, you can play the sound here if needed)
                          ElevatedButton(
                            onPressed: () {
                              _speakInJapanese(foodData[index]["japName"]!); // نطق النص بالياباني
                            },
                            child: Text('Speak in Japanese'),
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
              },
              child: Container(
                decoration: BoxDecoration(
                  color: foodData[index]["color"], // Set the color
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: Text(
                  textAlign: TextAlign.center,
                  foodData[index]["EnName"]!, // Display English phrase name
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
