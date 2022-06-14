import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        child: CircularProgressIndicator(strokeWidth: 8),
        height: 100,
        width: 100,
      ),
    );
  }
}
