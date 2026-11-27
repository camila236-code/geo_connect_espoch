import 'package:flutter_tts/flutter_tts.dart';

/// Servicio de síntesis de voz. Centraliza la configuración en español.
class TtsService {
  final FlutterTts _tts = FlutterTts();
  bool _listo = false;

  Future<void> inicializar() async {
    if (_listo) return;
    await _tts.setLanguage('es-ES');
    await _tts.setSpeechRate(0.45);
    await _tts.setVolume(1.0);
    await _tts.setPitch(1.0);
    _listo = true;
  }

  Future<void> hablar(String texto) async {
    if (texto.trim().isEmpty) return;
    await inicializar();
    await _tts.speak(texto);
  }

  Future<void> detener() => _tts.stop();

  Future<void> dispose() => _tts.stop();
}
