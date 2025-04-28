import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:toku/data/numbers_data.dart';

class NumbersPage extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();  // إعداد مكون تحويل النص إلى كلام

  NumbersPage({super.key});


  // دالة لتشغيل الصوت عند الضغط على الرقم
  Future<void> _speakNumber(String number) async {
    await flutterTts.setLanguage("ja-JP"); // تعيين اللغة إلى اليابانية
    await flutterTts.setPitch(1); // ضبط النغمة
    await flutterTts.setSpeechRate(0.5); // تعيين سرعة الكلام
    await flutterTts.speak(number); // التحدث بالرقم
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Numbers',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: 100,
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
                          '${index + 1}',
                          style: TextStyle(fontSize: 50),
                        ),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${romajiNumbers(index + 1)}',
                            style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                      actions: [
                        // زر الاستماع للتراجم
                        TextButton(
                          child: Text('Listen to Translation'),
                          onPressed: () {
                            _speakNumber('${index + 1}');  // تشغيل الصوت عند الضغط على الزر
                          },
                        ),
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
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    fontSize: 24,
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
