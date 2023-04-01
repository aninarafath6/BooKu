import 'package:flutter/material.dart';

//? external packages
import 'package:flutter_screenutil/flutter_screenutil.dart';

//? internal packages
import 'package:google_fonts/google_fonts.dart';
import 'package:machine_test/common/constants/color_constants.dart';
import 'package:machine_test/common/constants/image_constants.dart';
import 'package:machine_test/common/widgets/custom_icon_button.dart';
import 'package:machine_test/views/book_mark/book_mark_view.dart';

AppBar homeAppBar(BuildContext context) {
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
    actions: [
      CustomIconButton(
        iconPATH: AppImages.alertIcon,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BookmarkView()),
          );
        },
      ),
    ],
  );
}
