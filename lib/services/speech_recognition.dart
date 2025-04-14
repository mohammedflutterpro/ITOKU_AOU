import 'package:speech_to_text/speech_to_text.dart';

Future<bool> initializeSpeech(SpeechToText _speechToText) async {
  return await _speechToText.initialize();
}
