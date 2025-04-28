import 'package:flutter_tts/flutter_tts.dart';
import 'package:kana_kit/kana_kit.dart';

final FlutterTts _flutterTts = FlutterTts();

void speakInJapanese(String text) async {
  await _flutterTts.setLanguage('ja-JP');
  await _flutterTts.setSpeechRate(0.5);
  await _flutterTts.setVolume(1.0);  // ضبط الصوت لأعلى مستوى
  await _flutterTts.setPitch(1.0);   // ضبط طبقة الصوت
  await _flutterTts.speak(text);
}

String convertToRomaji(String text) {
  final kanaKit = KanaKit(); // تهيئة الكائن عند الحاجة
  return kanaKit.toRomaji(text);
}
