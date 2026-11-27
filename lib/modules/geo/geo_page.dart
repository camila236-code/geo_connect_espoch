import 'package:geo_connect_espoch/widgets/placeholder_page.dart';
import 'package:material_ui/material_ui.dart';

/// Espacio reservado al mapa OSM y rutas que implementará Anónimo (Prompt 3).
class GeoPage extends StatelessWidget {
  const GeoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderPage(
      titulo: 'GeoESPOCH',
      descripcion: 'Aquí Anónimo integrará flutter_map, geolocator, marcadores del campus y rutas peatonales accesibles.',
      icono: Icons.map_outlined,
      color: Color(0xFF6A1B9A),
    );
  }
}
