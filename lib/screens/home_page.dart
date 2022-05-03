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
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Loot Hunt',
          style: theme.textTheme.headline4,
        ),
        centerTitle: true,
      ),
      body: CatalogWidget(favoriteLoots, filter: false),
      drawer: _MenuDrawerWidget(favoriteLoots: favoriteLoots),
    );
  }
}

class _MenuDrawerWidget extends StatelessWidget {
  const _MenuDrawerWidget({
    Key? key,
    required this.favoriteLoots,
  }) : super(key: key);

  final List<int> favoriteLoots;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Row(
              children: [
                const FlutterLogo(),
                Text(
                  'Loot Hunt',
                  style: theme.textTheme.headline4,
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              'Favorites',
              style: theme.textTheme.subtitle2,
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
