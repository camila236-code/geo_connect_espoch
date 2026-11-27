import 'package:geo_connect_espoch/models/pictogram.dart';
import 'package:geo_connect_espoch/services/tts_service.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

/// Cuadrícula de pictogramas que compone una frase y la reproduce con TTS.
class TalkBoardPage extends StatefulWidget {
  const TalkBoardPage({super.key});

  @override
  State<TalkBoardPage> createState() => _TalkBoardPageState();
}

class _TalkBoardPageState extends State<TalkBoardPage> {
  final TtsService _tts = TtsService();
  final List<Pictograma> _frase = [];

  // EJEMPLO - VALIDAR: el catálogo definitivo lo aporta Gaby.
  static const _pictogramas = <Pictograma>[
    Pictograma(id: 'p01', etiqueta: 'Hola', categoria: 'saludos', asset: 'hola.png', color: Color(0xFF2196F3)),
    Pictograma(id: 'p02', etiqueta: 'Gracias', categoria: 'saludos', asset: 'gracias.png', color: Color(0xFF4CAF50)),
    Pictograma(id: 'p03', etiqueta: 'Ayuda', categoria: 'emergencia', asset: 'ayuda.png', color: Color(0xFFF44336)),
    Pictograma(id: 'p04', etiqueta: 'Agua', categoria: 'necesidades', asset: 'agua.png', color: Color(0xFF00BCD4)),
    Pictograma(id: 'p05', etiqueta: 'Comida', categoria: 'necesidades', asset: 'comida.png', color: Color(0xFFFF9800)),
    Pictograma(id: 'p06', etiqueta: 'Baño', categoria: 'necesidades', asset: 'bano.png', color: Color(0xFF9C27B0)),
    Pictograma(id: 'p07', etiqueta: 'Clase', categoria: 'campus', asset: 'clase.png', color: Color(0xFF3F51B5)),
    Pictograma(id: 'p08', etiqueta: 'Biblioteca', categoria: 'campus', asset: 'biblioteca.png', color: Color(0xFF009688)),
    Pictograma(id: 'p09', etiqueta: 'Laboratorio', categoria: 'campus', asset: 'laboratorio.png', color: Color(0xFF795548)),
    Pictograma(id: 'p10', etiqueta: 'Sí', categoria: 'respuestas', asset: 'si.png', color: Color(0xFF8BC34A)),
    Pictograma(id: 'p11', etiqueta: 'No', categoria: 'respuestas', asset: 'no.png', color: Color(0xFFE91E63)),
    Pictograma(id: 'p12', etiqueta: 'Dolor', categoria: 'emergencia', asset: 'dolor.png', color: Color(0xFFFF5722)),
  ];

  IconData _iconoDe(String id) {
    switch (id) {
      case 'p01':
      case 'p02':
        return Icons.waving_hand_outlined;
      case 'p03':
        return Icons.front_hand_outlined;
      case 'p04':
        return Icons.local_drink_outlined;
      case 'p05':
        return Icons.restaurant_outlined;
      case 'p06':
        return Icons.bedtime_outlined;
      case 'p07':
        return Icons.school_outlined;
      case 'p08':
        return Icons.local_library_outlined;
      case 'p09':
        return Icons.science_outlined;
      case 'p10':
        return Icons.check_circle_outline;
      case 'p11':
        return Icons.cancel_outlined;
      case 'p12':
        return Icons.healing_outlined;
      default:
        return Icons.chat_bubble_outline;
    }
  }

  void _agregar(Pictograma pictograma) {
    setState(() => _frase.add(pictograma));
  }

  void _borrar() {
    setState(() => _frase.clear());
  }

  Future<void> _reproducir() async {
    if (_frase.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Primero elige un pictograma')),
      );
      return;
    }
    final texto = _frase.map((p) => p.etiqueta).join(' ');
    try {
      await _tts.hablar(texto);
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No se pudo reproducir la voz')),
      );
    }
  }

  @override
  void dispose() {
    _tts.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textoFrase = _frase.isEmpty
        ? 'Toca los pictogramas para formar una frase'
        : _frase.map((p) => p.etiqueta).join(' ');

    return Scaffold(
      appBar: AppBar(
        title: const Text('TalkBoard Connect'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Volver al menú',
          onPressed: () => context.go('/home'),
        ),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Semantics(
              label: 'Frase actual: $textoFrase',
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: Text(
                  textoFrase,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: FilledButton.icon(
                    onPressed: _reproducir,
                    icon: const Icon(Icons.volume_up),
                    label: const Text('Reproducir frase'),
                  ),
                ),
                const SizedBox(width: 12),
                OutlinedButton.icon(
                  onPressed: _frase.isEmpty ? null : _borrar,
                  icon: const Icon(Icons.delete_outline),
                  label: const Text('Borrar'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              padding: const EdgeInsets.all(16),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: [
                for (final pictograma in _pictogramas)
                  Semantics(
                    button: true,
                    label: 'Agregar ${pictograma.etiqueta}',
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: pictograma.color,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: () => _agregar(pictograma),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(_iconoDe(pictograma.id), size: 32),
                          const SizedBox(height: 6),
                          Text(
                            pictograma.etiqueta,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
