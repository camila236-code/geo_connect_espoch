import 'package:geo_connect_espoch/modules/alerts/alerts_page.dart';
import 'package:geo_connect_espoch/modules/geo/geo_page.dart';
import 'package:geo_connect_espoch/modules/settings/settings_page.dart';
import 'package:geo_connect_espoch/modules/talkboard/talkboard_page.dart';
import 'package:geo_connect_espoch/modules/voice/voice_page.dart';
import 'package:geo_connect_espoch/widgets/home_menu.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const GeoConnectApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(path: '/home', builder: (context, state) => const HomeMenu()),
    GoRoute(path: '/talkboard', builder: (context, state) => const TalkBoardPage()),
    GoRoute(path: '/voice', builder: (context, state) => const VoicePage()),
    GoRoute(path: '/map', builder: (context, state) => const GeoPage()),
    GoRoute(path: '/help', builder: (context, state) => const AlertsPage()),
    GoRoute(path: '/settings', builder: (context, state) => const SettingsPage()),
  ],
);

class GeoConnectApp extends StatelessWidget {
  const GeoConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Geo Connect ESPOCH',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
