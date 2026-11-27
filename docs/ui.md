# UI y navegación — Geo Connect ESPOCH

**Responsable:** Cami · **Prompt:** 2 · **Estado:** prototipo inicial

## 1. Árbol de widgets y rutas

```text
GeoConnectApp (MaterialApp.router)
└─ GoRouter
   ├─ /home        → HomeMenu (5 botones grandes)
   ├─ /talkboard   → TalkBoardPage (cuadrícula + frase + TTS)
   ├─ /voice       → VoicePage (STT, pendiente Gaby)
   ├─ /map         → GeoPage (OSM, pendiente Anónimo)
   ├─ /help        → AlertsPage (Firebase, pendiente Anónimo)
   └─ /settings    → SettingsPage (preferencias)
```

## 2. Modelo de pictograma

```dart
class Pictograma {
  final String id;
  final String etiqueta;
  final String categoria;
  final String asset;
  final Color color;
}
```

### Ejemplo de datos (`assets/pictograms/pictogramas.json`)

> Ejemplos marcados como **EJEMPLO - VALIDAR**; el catálogo definitivo lo aporta Gaby.

```json
[
  {"id":"p01","etiqueta":"Hola","categoria":"saludos","asset":"hola.png","color":"#2196F3"},
  {"id":"p02","etiqueta":"Gracias","categoria":"saludos","asset":"gracias.png","color":"#4CAF50"},
  {"id":"p03","etiqueta":"Ayuda","categoria":"emergencia","asset":"ayuda.png","color":"#F44336"},
  {"id":"p04","etiqueta":"Agua","categoria":"necesidades","asset":"agua.png","color":"#00BCD4"},
  {"id":"p05","etiqueta":"Comida","categoria":"necesidades","asset":"comida.png","color":"#FF9800"},
  {"id":"p06","etiqueta":"Baño","categoria":"necesidades","asset":"bano.png","color":"#9C27B0"},
  {"id":"p07","etiqueta":"Clase","categoria":"campus","asset":"clase.png","color":"#3F51B5"},
  {"id":"p08","etiqueta":"Biblioteca","categoria":"campus","asset":"biblioteca.png","color":"#009688"},
  {"id":"p09","etiqueta":"Laboratorio","categoria":"campus","asset":"laboratorio.png","color":"#795548"},
  {"id":"p10","etiqueta":"Sí","categoria":"respuestas","asset":"si.png","color":"#8BC34A"},
  {"id":"p11","etiqueta":"No","categoria":"respuestas","asset":"no.png","color":"#E91E63"},
  {"id":"p12","etiqueta":"Dolor","categoria":"emergencia","asset":"dolor.png","color":"#FF5722"}
]
```

## 3. Código de referencia

El archivo `lib/modules/talkboard/talkboard_page.dart` implementa:

- cuadrícula de pictogramas con `Wrap`;
- frase acumulada en una tarjeta;
- botón **Reproducir frase** usando `flutter_tts`;
- botón **Borrar** y control de errores de TTS.

## 4. Checklist de accesibilidad

- [x] Botones táctiles ≥ 48 dp.
- [x] `Semantics` con etiqueta en cada botón del menú.
- [x] Contraste alto (teal sobre blanco).
- [x] Texto escalable (`MediaQuery.textScalerOf` respetado por Material).
- [x] Iconos + texto, nunca solo iconos.
- [ ] Modo alto contraste (pendiente Configuración).
- [ ] Auditoría con TalkBack (pendiente Gaby).

## 5. Pruebas de widget sugeridas

1. Tocar 3 pictogramos → la frase contiene las 3 etiquetas en orden.
2. Tocar “Borrar” → la frase queda vacía.
3. Tocar “Reproducir frase” con frase vacía → no lanza TTS y muestra aviso.
