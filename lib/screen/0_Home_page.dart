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
import 'package:flutter_tts/flutter_tts.dart';

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
  FlutterTts _flutterTts = FlutterTts();
  bool _showBadge = false; // متغير للتحكم في ظهور الإشعار
  bool _animateBadge = false; // متغير للتحكم في الأنيميشن للبادج

  @override
  void initState() {
    super.initState();
    initspeech();
    // جعل الإشعار يظهر تلقائيًا بعد تحميل الصفحة
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _showBadge = true;
      });
    });
  }

  void initspeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startlestining() async {
    await _speechToText.listen(onResult: _onspeechresult);
    setState(() {
      _conLevel = 0;
      _showBadge = false; // إخفاء الإشعار عند بدء الاستماع
      _animateBadge = false; // إخفاء الأنيميشن للبادج
    });
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {
      _showBadge = true; // إظهار البادج بعد التوقف
      _animateBadge = true; // تفعيل الأنيميشن للبادج
    });
  }

  void _onspeechresult(SpeechRecognitionResult result) async {
    setState(() {
      _wordsspoking = result.recognizedWords;
      _conLevel = result.confidence ?? 0.0;
    });

    if (!_speechToText.isListening && result.finalResult) {
      final translator = GoogleTranslator();
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
            TextButton(
              onPressed: () {
                _flutterTts.setLanguage('ja-JP');
                _flutterTts.setSpeechRate(0.5);
                _flutterTts.speak(translation.text);
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
        title: const Text(
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
                    ? "Talk to me"
                    : 'not available',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Text(_wordsspoking,style: TextStyle(color: Colors.blue,fontSize: 30,backgroundColor: Colors.amber),),
            ),
          ),
          if (_speechToText.isNotListening && _conLevel > 0)
            Padding(
              padding: const EdgeInsets.only(bottom: 5,right:100 ),
              child: Text(
                "Accuracy : ${(_conLevel * 100).toStringAsFixed(1)}%",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
        ],
      ),
      floatingActionButton: Stack(
        alignment: Alignment.topRight,
        clipBehavior: Clip.none,
        children: [
          AnimatedSlide(
            offset: _animateBadge ? Offset.zero : Offset(0, -0.5),
            duration: Duration(milliseconds: 300),
            child: AnimatedOpacity(
              opacity: _showBadge ? 1.0 : 0.0,
              duration: Duration(milliseconds: 300),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "talk to me",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: _speechToText.isListening ? _stopListening : _startlestining,
            tooltip: "listen",
            child: Icon(
              _speechToText.isNotListening ? Icons.mic_off : Icons.mic,
              color: Colors.white,
            ),
            backgroundColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
