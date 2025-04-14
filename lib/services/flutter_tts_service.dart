import 'package:flutter_tts/flutter_tts.dart';
import 'package:kana_kit/kana_kit.dart';

final FlutterTts _flutterTts = FlutterTts();

void speakInJapanese(String text) {
  _flutterTts.setLanguage('ja-JP');
  _flutterTts.setSpeechRate(0.5);
  _flutterTts.speak(text);
}

String convertToRomaji(String text) {
  final kanaKit = KanaKit();
  return kanaKit.toRomaji(text);
}
