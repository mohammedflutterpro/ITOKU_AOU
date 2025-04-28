import 'dart:math';
import 'package:flutter/material.dart';
import '../data/colors_data.dart';
import '../services/flutter_tts_service.dart';
import '../services/translation.dart';

class ColorsPage extends StatelessWidget {
  ColorsPage({super.key});

  void _showQuizDialog(BuildContext context) {
    final randomColor = colorsData[Random().nextInt(colorsData.length)];
    final enName = randomColor["EnName"]!;
    final japName = randomColor["japName"] ?? "Unknown";

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Center(
          child: Text(
            "Color Quiz",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: randomColor["color"],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey.shade400, width: 2),
              ),
            ),
            SizedBox(height: 20),
            Text("What's this color called in Japanese?", style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.translate),
              label: Text("Reveal Answer"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
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
            child: Text("Close", style: TextStyle(color: Colors.deepPurple)),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 4,
        backgroundColor: Colors.deepPurpleAccent,
        title: Text('Colors', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.quiz, color: Colors.white),
            onPressed: () => _showQuizDialog(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: colorsData.length,
          itemBuilder: (context, index) {
            final enName = colorsData[index]["EnName"]!;
            final japName = colorsData[index]["japName"] ?? "Unknown";
            final color = colorsData[index]["color"] as Color;

            return GestureDetector(
              onTap: () async {
                final japName = colorsData[index]["japName"] ?? await translateToJapanese(enName);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    title: Center(
                      child: Text(
                        enName,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.grey.shade300, width: 2),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(japName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                        if (enName.toLowerCase() == "white" || enName.toLowerCase() == "black")
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              enName.toLowerCase() == "white"
                                  ? "In Japan, white symbolizes purity"
                                  : "Black represents formality and mystery",
                              style: TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ),
                        SizedBox(height: 10),
                        // Button to play the Japanese audio
                        ElevatedButton.icon(
                          onPressed: () => speakInJapanese(japName),
                          icon: Icon(Icons.volume_up),
                          label: Text(convertToRomaji(japName)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        // Button to play the English audio
                        ElevatedButton.icon(
                          onPressed: () => speakInEnglish(enName),
                          icon: Icon(Icons.volume_up),
                          label: Text(enName),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        child: Text('Close', style: TextStyle(color: Colors.deepPurple)),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  enName,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: _getTextColorForBackground(color),
                    shadows: [
                      Shadow(offset: Offset(1, 1), blurRadius: 2, color: Colors.black26),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Color _getTextColorForBackground(Color backgroundColor) {
    return backgroundColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;
  }
}