import 'package:flutter/material.dart';

import '../data/colors_data.dart';
import '../services/flutter_tts_service.dart';
import '../services/translation.dart';

class ColorsPage extends StatelessWidget {
  ColorsPage({super.key});

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
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: colorsData.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                String enName = colorsData[index]["EnName"]!;
                String japName = colorsData[index]["japName"] ?? await translateToJapanese(enName);

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
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(offset: Offset(1.0, 1.0), blurRadius: 3.0, color: Colors.black),
                              Shadow(offset: Offset(-1.0, 1.0), blurRadius: 3.0, color: Colors.black),
                              Shadow(offset: Offset(1.0, -1.0), blurRadius: 3.0, color: Colors.black),
                              Shadow(offset: Offset(-1.0, -1.0), blurRadius: 3.0, color: Colors.black),
                            ],
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
                              color: colorsData[index]["color"],
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.black, width: 2),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            japName,
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton.icon(
                            onPressed: () {
                              speakInJapanese(japName);
                            },
                            icon: Icon(Icons.volume_up),
                            label: Text("اسمع بالياباني"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurpleAccent,
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
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: colorsData[index]["color"],
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                alignment: Alignment.center,
                child: Text(
                  colorsData[index]["EnName"]!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(offset: Offset(1.0, 1.0), color: Colors.black, blurRadius: 2),
                      Shadow(offset: Offset(-1.0, -1.0), color: Colors.black, blurRadius: 2),
                      Shadow(offset: Offset(-1.0, 1.0), color: Colors.black, blurRadius: 2),
                      Shadow(offset: Offset(1.0, -1.0), color: Colors.black, blurRadius: 2),
                    ],
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