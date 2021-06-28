import 'package:flutter/material.dart';

import '../../../data/models/enterprise.dart';
import '../../../themes/app_theme.dart';

class ListTileEnterpriseWidget extends StatelessWidget with MixinTheme {
  final Enterprise enterprise;
  final VoidCallback? onTap;
  final BorderRadius borderRadius;

  ListTileEnterpriseWidget({Key? key, required this.enterprise, required this.onTap})
      : borderRadius = BorderRadius.circular(4),
        super(key: key);

  const ListTileEnterpriseWidget.noOnTap({Key? key, required this.enterprise})
      : onTap = null,
        borderRadius = BorderRadius.zero,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: enterprise.color,
      borderRadius: borderRadius,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: onTap,
        child: SizedBox(
          height: 120,
          child: Center(child: Text(enterprise.enterpriseName, style: theme.fonts.headline7White)),
        ),
      ),
    );
  }
}
