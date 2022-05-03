import 'package:flutter/material.dart';

import '../components/catalog_widget.dart';

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
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorite Loots',
          style: theme.textTheme.headline4,
        ),
        centerTitle: true,
      ),
      body: CatalogWidget(favoriteLoots, filter: true),
    );
  }
}
