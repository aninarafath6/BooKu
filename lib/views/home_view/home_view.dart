import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:machine_test/common/constants/color_constants.dart';
import 'package:machine_test/common/constants/image_constants.dart';

import 'package:machine_test/views/home_view/widgets/bg_overlay.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            const BgOverlay(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    title: Text(
                      "BooKu",
                      style: GoogleFonts.merriweather(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp,
                      ),
                    ),
                    centerTitle: true,
                    toolbarHeight: 60,
                    leading: SizedBox(
                      height: 40,
                      child: IconButton(
                        splashRadius: 25.w,
                        onPressed: () => {},
                        icon: SvgPicture.asset(
                          AppImages.menuIcon,
                          width: 30.w,
                          height: 30.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
