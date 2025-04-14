import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:toku/Compononets/Category_Item.dart';
import 'package:toku/screen/1_Numbers_Page.dart';
import 'package:toku/screen/3_Colors.dart';
import 'package:toku/screen/4_Phrases.dart';
import 'package:toku/screen/Quiz/Quiz.dart';
import 'package:translator/translator.dart';
import '2_Family_Members.dart';
import '5_food.dart';
import 'package:kana_kit/kana_kit.dart';
import 'package:flutter_tts/flutter_tts.dart';  // إضافة المكتبة

class HomePage_Toku extends StatefulWidget {
  const HomePage_Toku({super.key});

  @override
  State<HomePage_Toku> createState() => _HomePage_TokuState();
}

class _HomePage_TokuState extends State<HomePage_Toku> {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _wordsspoking = '';
  double _conLevel = 0;
  FlutterTts _flutterTts = FlutterTts();  // إنشاء كائن FlutterTts

  @override
  void initState() {
    super.initState();
    initspeech();
  }

  void initspeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startlestining() async {
    await _speechToText.listen(onResult: _onspeechresult);
    setState(() {
      _conLevel = 0;
    });
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onspeechresult(SpeechRecognitionResult result) async {
    setState(() {
      _wordsspoking = result.recognizedWords;
      _conLevel = result.confidence ?? 0.0;
    });

    if (!_speechToText.isListening && result.finalResult) {
      final translator = GoogleTranslator();

      // ترجمة النص من الإنجليزية إلى اليابانية
      final translation = await translator.translate(
        result.recognizedWords,
        from: 'en',
        to: 'ja',
      );
      final kanaKit = KanaKit();
      final romaji = kanaKit.toRomaji(translation.text);

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Japanese Pronunciation'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("English words:"),
              Text(
                result.recognizedWords,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text("Japanese Translation:"),
              Text(
                translation.text,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text("Pronunciation (Romaji):"),
              Text(
                romaji,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
            // زرار "Listen in Japanese"
            TextButton(
              onPressed: () {
                _flutterTts.setLanguage('ja-JP');  // تعيين اللغة اليابانية
                _flutterTts.setSpeechRate(0.5);  // تعديل سرعة النطق
                _flutterTts.speak(translation.text);  // نطق الترجمة اليابانية
              },
              child: Text('Listen in Japanese'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(
          'Toku',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Category(
            text: 'Number',
            emoji: '🔢',
            color: Colors.amber,
            ontap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return NumbersPage();
              }));
            },
          ),
          Category(
            text: 'Family Members',
            emoji: '👨‍👩‍👧‍👦',
            color: Colors.green,
            ontap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FamilyMembers();
              }));
            },
          ),
          Category(
            text: 'Colors',
            emoji: '🎨',
            color: Colors.purple,
            ontap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ColorsPage();
              }));
            },
          ),
          Category(
            text: 'Phrases',
            emoji: '💬',
            color: Colors.blue,
            ontap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Phrases();
              }));
            },
          ),
          Category(
            text: 'Food',
            emoji: '🍽️',
            color: Colors.redAccent,
            ontap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return food();
              }));
            },
          ),
          Category(
            text: 'Quiz',
            emoji: '📝',
            color: Colors.orange,
            ontap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return QuizPage();
              }));
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Text(
                _speechToText.isListening
                    ? "listening..."
                    : _speechEnabled
                    ? "tap the mic"
                    : 'not available',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Expanded(child: Container(
            child: Text(_wordsspoking),
          ),),
          if (_speechToText.isNotListening && _conLevel > 0)
            Text(
              "confidence : ${(_conLevel * 100).toStringAsFixed(1)}%",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _speechToText.isListening ? _stopListening : _startlestining,
        tooltip: "listen",
        child: Icon(
          _speechToText.isNotListening ? Icons.mic_off : Icons.mic,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
