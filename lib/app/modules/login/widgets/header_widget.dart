import 'package:flutter/material.dart';

import '../../../themes/app_theme.dart';

class CurverPainter extends CustomPainter with MixinTheme {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..shader = theme.grandients.grapeAndByzantineAndMediumVioletRed.createShader(Rect.fromCircle(
        center: Offset(size.width, 0),
        radius: 360,
      ))
      ..style = PaintingStyle.fill;

    final Path path = Path()
      ..moveTo(0, size.height - 50)
      ..quadraticBezierTo(size.width / 2, size.height + 50, size.width, size.height - 50)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class HeaderWidget extends PreferredSize {
  HeaderWidget({required BuildContext context, required bool isKeyboardOpen})
      : super(
            child: SizedBox(
              height: !isKeyboardOpen ? MediaQuery.of(context).size.height * .2 : MediaQuery.of(context).size.height * .35,
              width: MediaQuery.of(context).size.width,
              child: CustomPaint(
                painter: CurverPainter(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/logo_ioasys_2.png'),
                    if (isKeyboardOpen)
                      ...[
                        const SizedBox(height: 16.42),
                        Text(
                          'Seja bem vindo ao empresas!',
                          style: DefaultAppTheme().fonts.headline6Black,
                        ),
                      ].toList()
                  ],
                ),
              ),
            ),
            preferredSize: Size.fromHeight(MediaQuery.of(context).size.height));
}
