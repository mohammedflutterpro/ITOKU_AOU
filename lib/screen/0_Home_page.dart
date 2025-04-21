import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:toku/screen/2_Family_Members.dart';
import 'package:toku/screen/3_Colors.dart';
import 'package:translator/translator.dart';
import 'package:kana_kit/kana_kit.dart';
import '../Compononets/WidgetsTranslation.dart';
import '../model/Category_Item.dart';
import '1_Numbers_Page.dart';
import '4_Phrases.dart';
import '5_food.dart';
import 'Quiz/Quiz.dart';

class HomePageToku extends StatefulWidget {
  const HomePageToku({Key? key}) : super(key: key);

  @override
  State<HomePageToku> createState() => _HomePageTokuState();
}

class _HomePageTokuState extends State<HomePageToku> {
  final SpeechToText _speechToText = SpeechToText();
  final FlutterTts _flutterTts = FlutterTts();
  bool _speechEnabled = false;
  String _spokenWords = '';
  double _confidence = 0.0;

  @override
  void initState() {
    super.initState();
    _initializeSpeech();
  }

  void _initializeSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() => _confidence = 0);
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(result) async {
    setState(() {
      _spokenWords = result.recognizedWords;
      _confidence = result.confidence ?? 0.0;
    });

    if (!_speechToText.isListening && result.finalResult) {
      final translator = GoogleTranslator();
      final translation = await translator.translate(_spokenWords, from: 'en', to: 'ja');
      final kanaKit = KanaKit();
      final romaji = kanaKit.toRomaji(translation.text);

      TranslationDialog.show(
        context: context,
        originalText: result.recognizedWords,
        translatedText: translation.text,
        romaji: romaji,
        flutterTts: _flutterTts,
      );

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text('IToku', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          CategoryItem(text: 'Number', emoji: '🔢', color: Colors.amber, ontap: () => _navigateTo(NumbersPage())),
          CategoryItem(text: 'Family Members', emoji: '👨‍👩‍👧‍👦', color: Colors.green, ontap: () => _navigateTo(FamilyMembers())),
          CategoryItem(text: 'Colors', emoji: '🎨', color: Colors.purple, ontap: () => _navigateTo(ColorsPage())),
          CategoryItem(text: 'Phrases', emoji: '💬', color: Colors.blue, ontap: () => _navigateTo(Phrases())),
          CategoryItem(text: 'Food', emoji: '🍽️', color: Colors.redAccent, ontap: () => _navigateTo(food())),
          CategoryItem(text: 'Quiz', emoji: '📝', color: Colors.orange, ontap: () => _navigateTo(QuizPage())),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _speechToText.isListening
                  ? "Listening..."
                  : _speechEnabled
                  ? "Talk to me"
                  : 'Speech not available',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Expanded(child: Text(_spokenWords)),
          if (_speechToText.isNotListening && _confidence > 0)
            Text("Confidence: ${(_confidence * 100).toStringAsFixed(1)}%",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _speechToText.isListening ? _stopListening : _startListening,
        tooltip: "Listen",
        backgroundColor: Colors.black,
        child: Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic, color: Colors.white),
      ),
    );
  }

  void _navigateTo(Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }
}
