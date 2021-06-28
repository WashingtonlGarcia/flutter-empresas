import 'dart:math';

import 'package:flutter/material.dart';

import '../../../themes/app_theme.dart';
import '../../../widgets/widgets.dart';

class HeaderWidget extends PreferredSize {
  HeaderWidget({required BuildContext context, required InputWidget input, required bool isOpenKeyboardOrScroll})
      : super(
          child: Material(
            elevation: isOpenKeyboardOrScroll ? 7 : 0,
            child: SizedBox(
              height: isOpenKeyboardOrScroll ? 90 + 24 : MediaQuery.of(context).size.height * .3 + 24,
              child: Stack(
                children: [
                  Container(
                    height: isOpenKeyboardOrScroll ? 90 : MediaQuery.of(context).size.height * .3,
                    decoration: BoxDecoration(gradient: DefaultAppTheme().grandients.mediumVioletRedAndByzantineAndGrape),
                    child: Visibility(
                      visible: !isOpenKeyboardOrScroll,
                      replacement: Row(),
                      child: LayoutBuilder(
                        builder: (context, constraints) => Stack(
                          children: [
                            Positioned(
                              top: -16,
                              left: (constraints.maxWidth - 204.74) / 3,
                              child: Transform.rotate(
                                angle: pi * -.7,
                                child: Image.asset(
                                  'assets/images/logo_ioasys_2.png',
                                  width: 200.74,
                                  height: 161.73,
                                  color: Colors.white.withOpacity(.15),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              left: -16,
                              bottom: 0,
                              child: Transform.rotate(
                                angle: pi * .2,
                                child: Image.asset(
                                  'assets/images/logo_ioasys_2.png',
                                  width: 119,
                                  height: 94,
                                  color: Colors.white.withOpacity(.15),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 32,
                              bottom: 12,
                              child: Transform.rotate(
                                angle: pi * .95,
                                child: Image.asset(
                                  'assets/images/logo_ioasys_2.png',
                                  width: 119,
                                  height: 94,
                                  color: Colors.white.withOpacity(.15),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              right: -32,
                              bottom: 94,
                              child: Transform.rotate(
                                angle: pi * .85,
                                child: Image.asset(
                                  'assets/images/logo_ioasys_2.png',
                                  width: 119,
                                  height: 94,
                                  color: Colors.white.withOpacity(.15),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: input),
                  ])
                ],
              ),
            ),
          ),
          preferredSize: Size.fromHeight(
            MediaQuery.of(context).size.height,
          ),
        );
}
