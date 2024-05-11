import 'package:speech_to_text/speech_to_text.dart';

class SoundListen {
  final speechToText = SpeechToText();

  Future<void> initSpeechToText() async {
    await speechToText.initialize();
  }
}
