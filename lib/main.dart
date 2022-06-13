import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loot_hunt/firebase_options.dart';

import 'theme/loot_hunt_theme.dart';
import 'routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const LootHuntApp());
}

class LootHuntApp extends StatelessWidget {
  const LootHuntApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loot Hunt',
      initialRoute: 'Login',
      routes: routes,
      theme: lootHuntTheme(),
    );
  }
}
