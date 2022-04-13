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
    Loot loot = ModalRoute.of(context)!.settings.arguments as Loot;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loot Hunt'),
        centerTitle: true,
      ),
      body: DescriptionWidget(loot: loot),
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

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({Key? key, required this.loot}) : super(key: key);

  final Loot loot;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(loot.title),
          Image.network(loot.thumbnail),
          Text(loot.description),
          ElevatedButton(
            child: const Text('Instructions'),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Instructions'),
                    content: Text(loot.instructions),
                    actions: [
                      TextButton(
                        child: const Text('Done!'),
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
