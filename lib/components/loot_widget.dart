import 'package:flutter/material.dart';

import '../models/loot.dart';

class LootWidget extends StatelessWidget {
  const LootWidget({Key? key, required this.loot}) : super(key: key);

  final Loot loot;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.fromLTRB(40, 40, 40, 0),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.0,
          color: theme.colorScheme.secondary,
        ),
        color: theme.colorScheme.tertiary,
        borderRadius: BorderRadius.circular(20),
      ),
      height: 380,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            loot.title,
            style: theme.textTheme.subtitle1,
          ),
          Image.network(loot.thumbnail),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                loot.price,
                style: theme
                    .copyWith(
                      textTheme: const TextTheme(
                        bodyText2: TextStyle(
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    )
                    .textTheme
                    .bodyText2,
              ),
              Text(
                loot.platforms,
                style: theme.textTheme.bodyText1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
