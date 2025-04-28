import 'package:translator/translator.dart';

Future<String> translateToJapanese(String text) async {
  final translator = GoogleTranslator();
  try {
    final Translation translation = await translator.translate(text, from: 'en', to: 'ja');
    return translation.text;
  } catch (e) {
    print("Error during translation: $e");
    return 'Translation failed';
  }
}
