import 'package:flutter/material.dart';

import '../models/loot.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({Key? key}) : super(key: key);

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Loot loot = ModalRoute.of(context)!.settings.arguments as Loot;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Loot Hunt',
          style: theme.textTheme.headline4,
        ),
        centerTitle: true,
      ),
      body: _DescriptionWidget(loot: loot),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.favorite),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Loot added to favorites!'),
            ),
          );
          Navigator.pop(context, loot.id);
        },
      ),
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({Key? key, required this.loot}) : super(key: key);

  final Loot loot;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        children: [
          Text(
            loot.title,
            style: theme.textTheme.subtitle1,
          ),
          Image.network(loot.thumbnail),
          Text(
            loot.description,
            style: theme.textTheme.bodyText1,
          ),
          ElevatedButton(
            child: Text(
              'Instructions',
              style: theme.textTheme.button,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      'Instructions',
                      style: theme.textTheme.subtitle2,
                    ),
                    content: Text(
                      loot.instructions,
                      style: theme.textTheme.bodyText1,
                    ),
                    actions: [
                      TextButton(
                        child: Text(
                          'Done!',
                          style: theme.textTheme.button,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
