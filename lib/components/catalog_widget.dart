import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/loot.dart';
import '../services/gamerpower.dart';
import 'loot_widget.dart';
import 'progress_indicator_widget.dart';

class CatalogWidget extends StatefulWidget {
  const CatalogWidget({
    required this.filter,
    Key? key,
  }) : super(key: key);

  final bool filter;

  @override
  State<CatalogWidget> createState() => _CatalogWidgetState();
}

class _CatalogWidgetState extends State<CatalogWidget> {
  late Future<List<Loot>> futureLoot;
  late Future<List<Loot>> filteredFutureLoot;

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
            filteredFutureLoot = _filterLoots(loots!);
            return FutureBuilder<List<Loot>>(
              future: filteredFutureLoot,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Loot>? loots = snapshot.data;
                  if (loots!.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                              'assets/images/large_fantasy_parchment.png'),
                          const Text(
                              'Oops! Looks like there\'s nothing here yet...'),
                        ],
                      ),
                    );
                  } else {
                    return _listLoots(loots);
                  }
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const ProgressIndicatorWidget();
              },
            );
          } else {
            return _listLoots(loots!);
          }
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const ProgressIndicatorWidget();
      },
    );
  }

  ListView _listLoots(List<Loot> loots) {
    return ListView.builder(
      itemCount: loots.length,
      itemBuilder: (context, index) {
        return InkWell(
          child: LootWidget(
            loot: loots[index],
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              'Description',
              arguments: loots[index],
            ).then((value) => setState(() {}));
          },
        );
      },
    );
  }

  Future<List<Loot>> _filterLoots(List<Loot> loots) async {
    List<Loot>? filteredLoots = [];

    await FirebaseFirestore.instance
        .collection('favorites')
        .where(
          'uid',
          isEqualTo: FirebaseAuth.instance.currentUser!.uid.toString(),
        )
        .get()
        .then(
      (value) {
        for (Loot loot in loots) {
          for (var doc in value.docs) {
            if (loot.id.toString() == doc['loot_id']) {
              filteredLoots.add(loot);
            }
          }
        }
      },
    );
    return filteredLoots;
  }
}
