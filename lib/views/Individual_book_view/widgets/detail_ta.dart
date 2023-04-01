import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:machine_test/common/constants/color_constants.dart';

class DetailTa extends StatelessWidget {
  const DetailTa({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 40.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.mulish(
              fontWeight: FontWeight.normal,
              color: AppColors.lightText,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 3.w),
          Text(
            value,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.mulish(
              fontWeight: FontWeight.w500,
              color: AppColors.textColor,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
