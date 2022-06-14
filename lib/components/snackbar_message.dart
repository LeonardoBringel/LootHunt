import 'package:flutter/material.dart';

void snackbarMessage(BuildContext context, String message) {
  final theme = Theme.of(context);

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: theme.textTheme.bodyText1,
      ),
      backgroundColor: theme.colorScheme.background,
      duration: const Duration(seconds: 3),
    ),
  );
}
