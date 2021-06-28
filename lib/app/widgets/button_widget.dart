import 'package:flutter/material.dart';

import '../themes/themes.dart' show MixinTheme;

class ButtonWidget extends StatelessWidget with MixinTheme {
  final String title;
  final VoidCallback onTap;

  const ButtonWidget({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: theme.colors.primary,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          height: 48,
          child: Align(
            child: Text(
              title,
              style: theme.fonts.button,
            ),
          ),
        ),
      ),
    );
  }
}
