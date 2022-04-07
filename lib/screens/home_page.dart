import 'package:flutter/material.dart';

import '../models/loot.dart';
import '../services/gamerpower.dart';
import 'loot_widget.dart';

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
      appBar: AppBar(
        title: const Text('Loot Hunt'),
        centerTitle: true,
      ),
      body: CatalogWidget(futureLoot: futureLoot),
    );
  }
}

class CatalogWidget extends StatelessWidget {
  const CatalogWidget({Key? key, required this.futureLoot}) : super(key: key);

  final Future<List<Loot>> futureLoot;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Loot>>(
      future: futureLoot,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Loot>? loots = snapshot.data;
          return ListView.builder(
            itemCount: loots!.length,
            itemBuilder: (context, index) {
              return LootWidget(
                title: loots[index].title,
                platforms: loots[index].platforms,
                thumbnail: loots[index].thumbnail,
                price: loots[index].price,
                date: loots[index].date,
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
