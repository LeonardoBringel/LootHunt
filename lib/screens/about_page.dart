import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About',
          style: theme.textTheme.headline4,
        ),
        centerTitle: true,
      ),
      body: const _AboutWidget(),
    );
  }
}

class _AboutWidget extends StatelessWidget {
  const _AboutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: CircleAvatar(
                radius: 100,
                backgroundColor: theme.colorScheme.tertiary,
                backgroundImage: Image.network(
                  'https://avatars.githubusercontent.com/u/64162701',
                ).image,
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
                child: Text(
                  // ignore: prefer_adjacent_string_concatenation
                  'Loot Hunt is a mobile app that allows you to easily keep ' +
                      'track of free game promotions by consuming ' +
                      'the GamerPower API.',
                  style: theme.textTheme.bodyText1,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Delevoped by https://github.com/LeonardoBringel',
                style: theme.textTheme.bodyText2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
