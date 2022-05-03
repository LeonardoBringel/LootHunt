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
      backgroundColor: theme.colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(
            child: Center(
              child: Column(
                children: [
                  const FlutterLogo(size: 64),
                  Text(
                    'Loot Hunt',
                    style: theme.textTheme.headline4,
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: 3),
            title: Text(
              'Favorites',
              style: theme.textTheme.subtitle2,
            ),
            leading: Icon(
              Icons.favorite,
              color: theme.colorScheme.secondary,
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                'Favorite',
                arguments: favoriteLoots,
              );
            },
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: 3),
            title: Text(
              'About',
              style: theme.textTheme.subtitle2,
            ),
            leading: Icon(
              Icons.info_outline,
              color: theme.colorScheme.secondary,
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                'About',
              );
            },
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: 3),
            title: Text(
              'Logout',
              style: theme.textTheme.subtitle2,
            ),
            leading: Icon(
              Icons.exit_to_app,
              color: theme.colorScheme.secondary,
            ),
            onTap: () {
              Navigator.popAndPushNamed(
                context,
                'Login',
              );
            },
          ),
        ],
      ),
    );
  }
}
