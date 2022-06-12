import 'package:flutter/material.dart';

import '../models/loot.dart';
import 'container_widget.dart';

class LootWidget extends StatelessWidget {
  const LootWidget({Key? key, required this.loot}) : super(key: key);

  final Loot loot;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ContainerWidget(
      children: [
        Text(
          loot.title,
          style: theme.textTheme.subtitle1,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Image.network(loot.thumbnail),
        ),
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
    );
  }
}
