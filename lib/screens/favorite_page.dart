import 'package:flutter/material.dart';

import '../components/catalog_widget.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorite Loots',
          style: theme.textTheme.headline4,
        ),
        centerTitle: true,
      ),
      body: const CatalogWidget(filter: true),
    );
  }
}
