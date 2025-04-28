import 'package:flutter/material.dart';
import 'package:toku/Compononets/Info_widget.dart';
import 'package:toku/model/inner_data.dart';
import '../data/phrases_data.dart';
import '../services/flutter_tts_service.dart';

class Phrases extends StatelessWidget {
  const Phrases();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Phrases',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:15, right: 15, top: 10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, // Number of columns in the grid
            mainAxisSpacing: 10,
            mainAxisExtent: 100,
          ),
          itemCount: phrasesData.length,
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
                          phrasesData[index]["EnName"]!,
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // عرض الاسم بالياباني (رومانجي)
                          SizedBox(height: 10),
                          Text(
                            (phrasesData[index]["japName"]!),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                      actions: [
                        // زر للاستماع إلى الترجمة بالصوت
                        TextButton(
                          child: Text('Listen to Translation'),
                          onPressed: () {
                            speakInJapanese(phrasesData[index]["japName"]!); // تشغيل الصوت
                          },
                        ),
                        // زر الإغلاق
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
                  color: phrasesData[index]["color"],
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: Text(
                  textAlign: TextAlign.center,
                  phrasesData[index]["EnName"]!, // عرض النص بالإنجليزي
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
