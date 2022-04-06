import 'package:flutter/material.dart';

import 'routes.dart';

void main() {
  runApp(const LootHunt());
}

class LootHunt extends StatelessWidget {
  const LootHunt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loot Hunt',
      initialRoute: 'HomePage',
      routes: routes,
      theme: ThemeData.dark(),
    );
  }
}
