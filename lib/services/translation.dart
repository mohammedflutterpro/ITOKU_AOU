import 'package:translator/translator.dart';

Future<Translation> translateToJapanese(String text) async {
  final translator = GoogleTranslator();
  return await translator.translate(text, from: 'en', to: 'ja');
}
