import 'package:flutter/material.dart';

import '../components/container_widget.dart';

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
            ContainerWidget(
              children: [
                Text(
                  'Loot Hunt is a mobile app that allows you to easily keep '
                  'track of free game promotions by consuming '
                  'the GamerPower API.',
                  style: theme.textTheme.bodyText1,
                ),
              ],
            ),
            ContainerWidget(
              children: [
                Text(
                  'Gamer Power API',
                  style: theme.textTheme.subtitle2,
                ),
                const Divider(),
                Text(
                  'https://www.gamerpower.com/ is the owner and providor of '
                  'GamerPower API who allows its unrestricted use, '
                  'as stated in https://www.gamerpower.com/api-read.',
                  style: theme.textTheme.bodyText1,
                ),
              ],
            ),
            ContainerWidget(
              children: [
                Text(
                  'Bebas Neue',
                  style: theme.textTheme.subtitle2,
                ),
                const Divider(),
                Text(
                  'These font is lincensed under '
                  'SIL Open Font License, more information can be '
                  'found at https://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=OFL.',
                  style: theme.textTheme.bodyText1,
                ),
              ],
            ),
            ContainerWidget(
              children: [
                Text(
                  'Fantasy Parchment',
                  style: theme.textTheme.subtitle2,
                ),
                const Divider(),
                Text(
                  'This icon was created by https://www.iconfinder.com/Chanut-is '
                  'who made it available for use in accordance with '
                  'https://creativecommons.org/licenses/by/3.0/.',
                  style: theme.textTheme.bodyText1,
                ),
              ],
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
