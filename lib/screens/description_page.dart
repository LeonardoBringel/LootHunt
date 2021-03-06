import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/snackbar_message.dart';
import '../models/loot.dart';

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({Key? key}) : super(key: key);

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
        onPressed: () async {
          var snapshot = await FirebaseFirestore.instance
              .collection('favorites')
              .where(
                'uid',
                isEqualTo: FirebaseAuth.instance.currentUser!.uid.toString(),
              )
              .where(
                'loot_id',
                isEqualTo: loot.id.toString(),
              )
              .get();

          bool isFavorite = snapshot.docs.isNotEmpty;

          if (isFavorite) {
            for (var doc in snapshot.docs) {
              await doc.reference.delete();
            }
          } else {
            await FirebaseFirestore.instance.collection('favorites').add(
              {
                'uid': FirebaseAuth.instance.currentUser!.uid.toString(),
                'loot_id': loot.id.toString(),
              },
            );
          }

          snackbarMessage(
            context,
            isFavorite
                ? 'Loot removed from favorites!'
                : 'Loot added to favorites!',
          );

          Navigator.pop(context);
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
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Text(
                loot.title,
                style: theme.textTheme.subtitle1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2.0,
                    color: theme.colorScheme.secondary,
                  ),
                  color: theme.colorScheme.tertiary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Image.network(loot.thumbnail),
                    Padding(
                      padding: const EdgeInsets.all(40),
                      child: Text(
                        loot.description,
                        style: theme.textTheme.bodyText1,
                      ),
                    ),
                    Text(
                      'Available at ' + loot.platforms + ' until ' + loot.date,
                      style: theme.textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 80, 20, 80),
              child: ElevatedButton(
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
                          style: theme.textTheme.subtitle2?.copyWith(
                            color: theme.colorScheme.secondary,
                          ),
                        ),
                        content: Text(
                          loot.instructions,
                          style: theme.textTheme.bodyText1,
                        ),
                        actions: [
                          TextButton(
                            child: Text(
                              'Done!',
                              style: theme.textTheme.button?.copyWith(
                                color: theme.colorScheme.secondary,
                              ),
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
            ),
          ],
        ),
      ),
    );
  }
}
