import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/loot.dart';
import '../services/gamerpower.dart';
import 'loot_widget.dart';

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
          } else {
            filteredFutureLoot = futureLoot;
          }
          return FutureBuilder<List<Loot>>(
            future: filteredFutureLoot,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Loot>? loots = snapshot.data;
                return ListView.builder(
                  itemCount: loots?.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: LootWidget(
                        loot: loots![index],
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
