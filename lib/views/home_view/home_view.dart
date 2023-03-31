import 'package:flutter/material.dart';

//? external packages
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:machine_test/common/constants/color_constants.dart';

//? Internal packages
import 'package:machine_test/views/home_view/widgets/bg_overlay.dart';
import 'package:machine_test/views/home_view/widgets/home_app_bar.dart';

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
                  homeAppBar(),
                  SizedBox(height: 16.h),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Recommended",
                              style: GoogleFonts.merriweather(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w800,
                                fontSize: 18.sp,
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all<Color>(
                                    AppColors.strokeColor),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.symmetric(
                                    horizontal: 0,
                                    vertical: 0,
                                  ),
                                ),
                                fixedSize: MaterialStateProperty.all<Size>(
                                    Size(70.w, 25.w)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100.0),
                                    side: const BorderSide(
                                      color: AppColors.strokeColor,
                                    ),
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                "See More",
                                style: GoogleFonts.mulish(
                                  fontSize: 10.sp,
                                  color: AppColors.lightText,
                                ),
                              ),
                            )
                            // InkWell(
                            //   onTap: () {},
                            //   child:
                            // ),
                          ],
                        )
                      ],
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
