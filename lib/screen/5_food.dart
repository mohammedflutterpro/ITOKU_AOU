import 'dart:math';
import 'package:flutter/material.dart';
import '../data/food_data.dart';
import '../services/flutter_tts_service.dart';

class Food extends StatelessWidget {
  Food({super.key});

  void _showQuizDialog(BuildContext context) {
    final randomFood = foodData[Random().nextInt(foodData.length)];
    final enName = randomFood["EnName"]!;
    final japName = randomFood["japName"] ?? "Unknown";

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Center(
          child: Text(
            "Food Quiz",
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
            if (randomFood["icon"] != null)
              Stack(
                alignment: Alignment.center,
                children: [
                  Icon(randomFood["icon"], size: 84, color: Colors.black), // Black outline
                  Icon(randomFood["icon"], size: 80, color: Colors.deepPurple), // Main icon
                ],
              ),
            SizedBox(height: 20),
            Text(
              enName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text("What's this called in Japanese?", style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.translate),
              label: Text("Reveal Answer"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
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
        title: Text('Food', style: TextStyle(color: Colors.white)),
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
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.2,
          ),
          itemCount: foodData.length,
          itemBuilder: (context, index) {
            final enName = foodData[index]["EnName"]!;
            final japName = foodData[index]["japName"]!;
            final color = foodData[index]["color"] as Color;

            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
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
                        if (foodData[index]["icon"] != null)
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Icon(foodData[index]["icon"],
                                  size: 84, color: Colors.black), // Black outline
                              Icon(foodData[index]["icon"],
                                  size: 80, color: Colors.white), // Main icon
                            ],
                          ),
                        SizedBox(height: 20),
                        Text(japName,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500)),
                        if (enName.toLowerCase() == "sushi" ||
                            enName.toLowerCase() == "ramen")
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              enName.toLowerCase() == "sushi"
                                  ? "Sushi is a traditional Japanese dish"
                                  : "Ramen is a popular noodle soup dish",
                              style: TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ),
                        SizedBox(height: 20),
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
                        child: Text('Close',
                            style: TextStyle(color: Colors.deepPurple)),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (foodData[index]["icon"] != null)
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(foodData[index]["icon"],
                              size: 44, color: Colors.black), // Black outline
                          Icon(foodData[index]["icon"],
                              size: 40, color: Colors.white), // Main icon
                        ],
                      ),
                    SizedBox(height: 8),
                    Text(
                      enName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}