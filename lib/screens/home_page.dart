import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/catalog_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
      body: const CatalogWidget(filter: false),
      drawer: const _MenuDrawerWidget(),
    );
  }
}

class _MenuDrawerWidget extends StatelessWidget {
  const _MenuDrawerWidget({Key? key}) : super(key: key);

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
                  Image.asset('assets/images/normal_fantasy_parchment.png'),
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
              Navigator.popAndPushNamed(context, 'Favorite');
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
              Navigator.popAndPushNamed(context, 'About');
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
            onTap: () async {
              await FirebaseAuth.instance.signOut();

              Navigator.pushNamedAndRemoveUntil(
                  context, 'Login', (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
