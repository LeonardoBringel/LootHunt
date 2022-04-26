import 'package:flutter/material.dart';

import '../components/catalog_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> favoriteLoots = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loot Hunt'),
        centerTitle: true,
      ),
      body: CatalogWidget(favoriteLoots, filter: false),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.favorite),
        onPressed: () {
          Navigator.pushNamed(
            context,
            'Favorite',
            arguments: favoriteLoots,
          );
        },
      ),
    );
  }
}
