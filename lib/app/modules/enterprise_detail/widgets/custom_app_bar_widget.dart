import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../themes/app_theme.dart';

class CustomAppBarWidget extends PreferredSize {
  CustomAppBarWidget({required String title})
      : super(
            child: AppBar(
              backgroundColor: DefaultAppTheme().colors.background,
              centerTitle: true,
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    color: DefaultAppTheme().colors.appBarIcon,
                    borderRadius: BorderRadius.circular(4),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(4),
                      onTap: () => Get.back(),
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: Icon(
                          Icons.arrow_back,
                          color: DefaultAppTheme().colors.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              title: Text(
                title,
                style: DefaultAppTheme().fonts.headline6White,
              ),
              elevation: 0,
            ),
            preferredSize: Size.fromHeight(AppBar().preferredSize.height));
}
