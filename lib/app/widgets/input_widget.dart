import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../themes/app_theme.dart';

class InputWidget extends TextFormField {
  InputWidget.search(
      {String? initialValue,
      required String hintText,
      required TextInputType textInputType,
      required bool enabled,
      List<TextInputFormatter>? textInputFormatters,
      required void Function(String) onChanged})
      : super(
          cursorColor: DefaultAppTheme().colors.primary,
          style: DefaultAppTheme().fonts.input,
          initialValue: initialValue,
          keyboardType: textInputType,
          enabled: enabled,
          inputFormatters: textInputFormatters,
          onChanged: onChanged,
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: DefaultAppTheme().colors.input,
            filled: true,
            hintText: hintText,
            hintStyle: DefaultAppTheme().fonts.inputSearch,
            prefixIcon: Icon(Icons.search, color: DefaultAppTheme().colors.inputIcon.withOpacity(.7)),
          ),
        );

  InputWidget.mail(
      {String? initialValue,
      required String? Function(String?) validator,
      required FocusNode focusNode,
      required TextInputType textInputType,
      required bool enabled,
      required TextInputAction textInputAction,
      List<TextInputFormatter>? textInputFormatters,
      required VoidCallback onFieldSubmitted,
      required void Function(String) onChanged})
      : super(
          cursorColor: DefaultAppTheme().colors.primary,
          style: DefaultAppTheme().fonts.input,
          initialValue: initialValue,
          validator: validator,
          focusNode: focusNode,
          keyboardType: textInputType,
          enabled: enabled,
          textInputAction: textInputAction,
          inputFormatters: textInputFormatters,
          onFieldSubmitted: (_) => onFieldSubmitted(),
          onChanged: onChanged,
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: DefaultAppTheme().colors.input,
            filled: true,
          ),
        );

  InputWidget.password(
      {String? initialValue,
      required String? Function(String?) validator,
      required FocusNode focusNode,
      required TextInputType textInputType,
      required bool enabled,
      bool obscureText = false,
      required VoidCallback obscureOnTap,
      required TextInputAction textInputAction,
      List<TextInputFormatter>? textInputFormatters,
      required VoidCallback onFieldSubmitted,
      required void Function(String) onChanged})
      : super(
          cursorColor: DefaultAppTheme().colors.primary,
          initialValue: initialValue,
          validator: validator,
          obscureText: obscureText,
          focusNode: focusNode,
          keyboardType: textInputType,
          enabled: enabled,
          textInputAction: textInputAction,
          onFieldSubmitted: (_) => onFieldSubmitted(),
          inputFormatters: textInputFormatters,
          onChanged: onChanged,
          style: DefaultAppTheme().fonts.input,
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: DefaultAppTheme().colors.input,
            suffixIcon: IconButton(
              icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off, color: DefaultAppTheme().colors.inputIcon),
              onPressed: obscureOnTap,
            ),
            filled: true,
          ),
        );
}

class InputTileWidget extends StatelessWidget with MixinTheme {
  final String placerHolder;
  final InputWidget input;

  const InputTileWidget({required this.placerHolder, required this.input});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text(placerHolder, style: theme.fonts.inputTitle), const SizedBox(height: 4), input],
    );
  }
}
