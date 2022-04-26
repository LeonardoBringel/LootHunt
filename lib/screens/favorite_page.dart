import 'package:flutter/material.dart';

import '../models/loot.dart';
import '../services/gamerpower.dart';
import '../components/loot_widget.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<int> favoriteLoots = [];

  @override
  Widget build(BuildContext context) {
    favoriteLoots = ModalRoute.of(context)!.settings.arguments as List<int>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Loots'),
        centerTitle: true,
      ),
      body: CatalogWidget(favoriteLoots),
    );
  }
}

// ignore: must_be_immutable
class CatalogWidget extends StatefulWidget {
  CatalogWidget(this.favoriteLoots, {Key? key}) : super(key: key);

  List<int> favoriteLoots;

  @override
  State<CatalogWidget> createState() => _CatalogWidgetState();
}

class _CatalogWidgetState extends State<CatalogWidget> {
  late Future<List<Loot>> futureLoot;

  @override
  void initState() {
    super.initState();
    futureLoot = fetchLoot();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Loot>>(
      future: futureLoot,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Loot>? loots = snapshot.data;
          List<Loot> savedLoots = [];
          for (Loot loot in loots!) {
            if (widget.favoriteLoots.contains(loot.id)) {
              savedLoots.add(loot);
            }
          }
          return ListView.builder(
            itemCount: savedLoots.length,
            itemBuilder: (context, index) {
              return InkWell(
                child: LootWidget(
                  loot: savedLoots[index],
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    'Description',
                    arguments: savedLoots[index],
                  );
                },
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
