import 'package:flutter/material.dart';

import 'routes.dart';

void main() {
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
      theme: ThemeData.dark(),
    );
  }
}
