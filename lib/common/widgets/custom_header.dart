import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:machine_test/common/constants/color_constants.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key, required this.title, this.onTap});
  final String title;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: GoogleFonts.merriweather(
            color: AppColors.textColor,
            fontWeight: FontWeight.w800,
            fontSize: 18.sp,
          ),
        ),
        const Spacer(),
        TextButton(
          style: ButtonStyle(
            overlayColor:
                MaterialStateProperty.all<Color>(AppColors.strokeColor),
            padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 0,
              ),
            ),
            fixedSize: MaterialStateProperty.all<Size>(Size(70.w, 25.w)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
      ],
    );
  }
}
