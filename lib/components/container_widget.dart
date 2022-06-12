import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
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
        child: Column(children: children),
      ),
    );
  }
}
