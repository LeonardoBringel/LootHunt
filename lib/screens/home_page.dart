import 'package:flutter/material.dart';

import '../models/loot.dart';
import '../services/gamerpower.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Loot>> futureLoot;

  @override
  void initState() {
    super.initState();
    futureLoot = fetchLoot();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LootList(futureLoot: futureLoot),
    );
  }
}

class LootList extends StatelessWidget {
  const LootList({Key? key, required this.futureLoot}) : super(key: key);

  final Future<List<Loot>> futureLoot;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<Loot>>(
        future: futureLoot,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Loot>? loots = snapshot.data;
            return ListView.builder(
              itemCount: loots!.length,
              itemBuilder: (context, index) {
                return Text(loots[index].title);
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
