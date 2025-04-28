import 'package:speech_to_text/speech_to_text.dart';

Future<bool> initializeSpeech(SpeechToText _speechToText) async {
  try {
    bool isInitialized = await _speechToText.initialize();
    return isInitialized;
  } catch (e) {
    print("Error initializing SpeechToText: $e");
    return false;
  }
}
