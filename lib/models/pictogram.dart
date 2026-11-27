import 'package:material_ui/material_ui.dart';

class Pictograma {
  final String id;
  final String etiqueta;
  final String categoria;
  final String asset;
  final Color color;

  const Pictograma({
    required this.id,
    required this.etiqueta,
    required this.categoria,
    required this.asset,
    required this.color,
  });

  factory Pictograma.fromJson(Map<String, dynamic> json) {
    return Pictograma(
      id: json['id'] as String,
      etiqueta: json['etiqueta'] as String,
      categoria: json['categoria'] as String,
      asset: json['asset'] as String,
      color: Color(int.parse((json['color'] as String).replaceFirst('#', '0xFF'))),
    );
  }
}
