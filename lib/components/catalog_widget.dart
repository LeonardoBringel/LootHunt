import 'package:flutter/material.dart';

import '../models/loot.dart';
import '../services/gamerpower.dart';
import 'loot_widget.dart';

// ignore: must_be_immutable
class CatalogWidget extends StatefulWidget {
  CatalogWidget(
    this.filterIds, {
    required this.filter,
    Key? key,
  }) : super(key: key);

  List<int> filterIds;
  final bool filter;

  @override
  State<CatalogWidget> createState() => _CatalogWidgetState();
}

class _CatalogWidgetState extends State<CatalogWidget> {
  late Future<List<Loot>> futureLoot;

  @override
  void initState() {
    super.initState();
    futureLoot = fetchLoot();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Loot>>(
      future: futureLoot,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Loot>? loots = snapshot.data;
          if (widget.filter) {
            loots = _filterLoots(loots!);
          }
          return ListView.builder(
            itemCount: loots?.length,
            itemBuilder: (context, index) {
              return InkWell(
                child: LootWidget(
                  loot: loots![index],
                ),
                onTap: () async {
                  final result = await Navigator.pushNamed(
                    context,
                    'Description',
                    arguments: loots![index],
                  );
                  if (result != null) {
                    widget.filterIds.add(int.parse(result.toString()));
                  }
                },
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const Center(
          child: SizedBox(
            child: CircularProgressIndicator(strokeWidth: 8),
            height: 100,
            width: 100,
          ),
        );
      },
    );
  }

  List<Loot> _filterLoots(List<Loot> loots) {
    List<Loot> filteredLoots = [];
    for (Loot loot in loots) {
      if (widget.filterIds.contains(loot.id)) {
        filteredLoots.add(loot);
      }
    }
    return filteredLoots;
  }
}
