import 'package:flutter/material.dart';
import 'package:toku/Compononets/Info_widget.dart';
import 'package:toku/model/inner_data.dart';

class ColorsPage extends StatelessWidget {
   ColorsPage({super.key});

  // List of colors with their English names and assets (for example purposes)
  final List<Map<String, dynamic>> colorsData = [
    {"EnName": "Blue", "japName": "Aoi", "color": Colors.blue, "image": "assets/colors/blue.jpg", "sound": "sound1"},
    {"EnName": "Red", "japName": "Aka", "color": Colors.red, "image": "assets/colors/red.jpg", "sound": "sound2"},
    {"EnName": "Green", "japName": "Midori", "color": Colors.green, "image": "assets/colors/green.jpg", "sound": "sound3"},
    {"EnName": "Yellow", "japName": "Kiiro", "color": Colors.yellow, "image": "assets/colors/yellow.jpg", "sound": "sound4"},
    {"EnName": "Purple", "japName": "Murasaki", "color": Colors.purple, "image": "assets/colors/purple.jpg", "sound": "sound5"},
    {"EnName": "Orange", "japName": "Orenji", "color": Colors.orange, "image": "assets/colors/orange.jpg", "sound": "sound6"},
    {"EnName": "Pink", "japName": "Pinku", "color": Colors.pink, "image": "assets/colors/pink.jpg", "sound": "sound7"},
    {"EnName": "Brown", "japName": "Chairo", "color": Colors.brown, "image": "assets/colors/brown.jpg", "sound": "sound8"},
    {"EnName": "Grey", "japName": "Gure", "color": Colors.grey, "image": "assets/colors/grey.jpg", "sound": "sound9"},
    {"EnName": "Black", "japName": "Kuro", "color": Colors.black, "image": "assets/colors/black.jpg", "sound": "sound10"},
    {"EnName": "White", "japName": "Shiro", "color": Colors.white, "image": "assets/colors/white.jpg", "sound": "sound11"},
    // Add more colors as needed...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: double.maxFinite,
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(
          'Colors',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Number of columns in the grid
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: colorsData.length,
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
                          colorsData[index]["EnName"]!,
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Display the color
                          Container(
                            width: 100,
                            height: 100,
                            color: colorsData[index]["color"], // Display the color directly
                          ),
                          SizedBox(height: 10),
                          // Display the Japanese name (romaji)
                          Text(
                            colorsData[index]["japName"]!, // Romaji name
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
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
                width: 100, // Fixed width for square shape
                height: 100, // Fixed height for square shape
                decoration: BoxDecoration(
                  color: colorsData[index]["color"], // Set the color
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: Text(
                  colorsData[index]["EnName"]!, // Display English color name
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
