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
      drawer: MenuDrawerWidget(favoriteLoots: favoriteLoots),
    );
  }
}

class MenuDrawerWidget extends StatelessWidget {
  const MenuDrawerWidget({
    Key? key,
    required this.favoriteLoots,
  }) : super(key: key);

  final List<int> favoriteLoots;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Row(
              children: const [
                FlutterLogo(),
                Text(
                  'Loot Hunt',
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text(
              'Favorites',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            leading: const Icon(Icons.favorite),
            onTap: () {
              Navigator.pushNamed(
                context,
                'Favorite',
                arguments: favoriteLoots,
              );
            },
          ),
        ],
      ),
    );
  }
}
