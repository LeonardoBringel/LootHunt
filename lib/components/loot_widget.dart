import 'package:flutter/material.dart';

import '../models/loot.dart';

class LootWidget extends StatelessWidget {
  const LootWidget({Key? key, required this.loot}) : super(key: key);

  final Loot loot;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.fromLTRB(40, 40, 40, 0),
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2.0,
            color: Colors.yellow.shade700,
          ),
          color: Colors.black54,
          borderRadius: BorderRadius.circular(20),
        ),
        width: MediaQuery.of(context).size.width * 0.9,
        height: 380,
        child: Column(
          children: [
            Text(
              loot.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.yellow.shade700,
              ),
            ),
            Image.network(loot.thumbnail),
            Text(
              loot.platforms,
              style: TextStyle(
                fontSize: 18,
                color: Colors.yellow.shade700,
              ),
            ),
            Text(
              'Was ' + loot.price + ' now is FREE until ' + loot.date,
              style: TextStyle(
                fontSize: 16,
                color: Colors.yellow.shade700,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(
          context,
          'DescriptionPage',
          arguments: loot,
        );
      },
    );
  }
}
