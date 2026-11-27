import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

class _Opcion {
  const _Opcion({
    required this.titulo,
    required this.subtitulo,
    required this.icono,
    required this.color,
    required this.ruta,
  });

  final String titulo;
  final String subtitulo;
  final IconData icono;
  final Color color;
  final String ruta;
}

/// Menú principal con 5 accesos grandes y etiquetas para lectores de pantalla.
class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  static const _opciones = <_Opcion>[
    _Opcion(
      titulo: 'TalkBoard Connect',
      subtitulo: 'Comunícate con pictogramas y voz',
      icono: Icons.grid_view_rounded,
      color: Color(0xFF00897B),
      ruta: '/talkboard',
    ),
    _Opcion(
      titulo: 'Voz a texto',
      subtitulo: 'Dicta y convierte tu voz en texto',
      icono: Icons.mic_none_rounded,
      color: Color(0xFF1565C0),
      ruta: '/voice',
    ),
    _Opcion(
      titulo: 'GeoESPOCH',
      subtitulo: 'Encuentra edificios y rutas del campus',
      icono: Icons.map_outlined,
      color: Color(0xFF6A1B9A),
      ruta: '/map',
    ),
    _Opcion(
      titulo: 'Alertas',
      subtitulo: 'Pide ayuda con tu ubicación',
      icono: Icons.help_outline_rounded,
      color: Color(0xFFC62828),
      ruta: '/help',
    ),
    _Opcion(
      titulo: 'Configuración',
      subtitulo: 'Ajusta texto, contraste y permisos',
      icono: Icons.settings_outlined,
      color: Color(0xFF455A64),
      ruta: '/settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geo Connect ESPOCH'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
          children: [
            Semantics(
              header: true,
              child: Text(
                '¿Qué necesitas hoy?',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            for (final opcion in _opciones)
              Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Semantics(
                  button: true,
                  label: '${opcion.titulo}. ${opcion.subtitulo}',
                  child: SizedBox(
                    height: 80,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: opcion.color,
                        foregroundColor: Colors.white,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () => context.go(opcion.ruta),
                      icon: Icon(opcion.icono, size: 34),
                      label: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(opcion.titulo),
                          const SizedBox(height: 2),
                          Text(
                            opcion.subtitulo,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
