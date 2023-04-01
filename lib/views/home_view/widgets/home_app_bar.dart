import 'package:flutter/material.dart';

//? external packages
import 'package:flutter_screenutil/flutter_screenutil.dart';

//? internal packages
import 'package:google_fonts/google_fonts.dart';
import 'package:machine_test/common/constants/color_constants.dart';
import 'package:machine_test/common/constants/image_constants.dart';
import 'package:machine_test/common/widgets/custom_icon_button.dart';

AppBar homeAppBar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    // App Bar title
    title: Text(
      "BooKu",
      style: GoogleFonts.merriweather(
        color: AppColors.textColor,
        fontWeight: FontWeight.w800,
        fontSize: 18.sp,
      ),
    ),
    centerTitle: true,
    toolbarHeight: 60,
    // leading section
    leading: const CustomIconButton(
      iconPATH: AppImages.menuIcon,
    ),
    // right side of the app bar
    actions: const [
      CustomIconButton(iconPATH: AppImages.alertIcon),
    ],
  );
}
