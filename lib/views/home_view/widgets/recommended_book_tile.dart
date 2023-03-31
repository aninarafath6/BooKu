import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:machine_test/common/constants/color_constants.dart';

class RecommendedBookTile extends StatelessWidget {
  const RecommendedBookTile({
    super.key,
    required this.title,
    required this.author,
    required this.imagePATH,
  });

  final String title;
  final String author;
  final String imagePATH;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 143.w,
      margin: EdgeInsets.only(right: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 212.h,
            width: 143.w,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.network(
                imagePATH,
                fit: BoxFit.cover,
                alignment: Alignment.centerLeft,
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.mulish(
                fontWeight: FontWeight.bold, fontSize: 14.sp),
          ),
          SizedBox(height: 6.h),
          Text(
            "- $author",
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.mulish(
              fontWeight: FontWeight.normal,
              color: AppColors.greyText,
              fontSize: 12.sp,
            ),
          )
        ],
      ),
    );
  }
}
