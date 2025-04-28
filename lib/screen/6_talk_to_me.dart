import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translator/translator.dart';
import 'package:kana_kit/kana_kit.dart';
import '../Compononets/WidgetsTranslation.dart';

class SpeechPage extends StatefulWidget {
  const SpeechPage({Key? key}) : super(key: key);

  @override
  _SpeechPageState createState() => _SpeechPageState();
}

class _SpeechPageState extends State<SpeechPage> {
  final SpeechToText _speechToText = SpeechToText();
  final FlutterTts _flutterTts = FlutterTts();
  final TextEditingController _textController = TextEditingController();

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
      _translateAndShowDialog(result.recognizedWords);
    }
  }

  void _onTranslateTypedText() {
    String typedText = _textController.text.trim();
    if (typedText.isNotEmpty) {
      _translateAndShowDialog(typedText);
    }
  }

  void _translateAndShowDialog(String englishText) async {
    final translator = GoogleTranslator();
    final translation = await translator.translate(englishText, from: 'en', to: 'ja');
    final kanaKit = KanaKit();
    final romaji = kanaKit.toRomaji(translation.text);

    TranslationDialog.show(
      context: context,
      originalText: englishText,
      translatedText: translation.text,
      romaji: romaji,
      flutterTts: _flutterTts,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9), // خلفية ناعمة
      appBar: AppBar(
        title: const Text('Speech to Japanese'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _speechToText.isListening
                  ? "🎤 Listening..."
                  : _speechEnabled
                  ? "Tap the mic and talk"
                  : 'Speech not available',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            if (_spokenWords.isNotEmpty)
              Text(
                '🗣️ Recognized Words: $_spokenWords',
                style: const TextStyle(fontSize: 16),
              ),
            if (_speechToText.isNotListening && _confidence > 0)
              Text(
                "Confidence: ${(_confidence * 100).toStringAsFixed(1)}%",
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            const Divider(height: 32),
            const Text(
              'Write English Text:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Type something in English...',
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _onTranslateTypedText,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Translate",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _speechToText.isListening ? _stopListening : _startListening,
        backgroundColor: Colors.teal,
        child: Icon(
          _speechToText.isNotListening ? Icons.mic_off : Icons.mic,
          color: Colors.white,
        ),
      ),
    );
  }
}
