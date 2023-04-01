import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:machine_test/common/constants/color_constants.dart';
import 'package:machine_test/common/constants/image_constants.dart';

class BookTile extends StatelessWidget {
  const BookTile({
    super.key,
    required this.title,
    required this.author,
    required this.imagePATH,
    required this.subTitle,
    required this.price,
    required this.pages,
  });

  final String title;
  final String author;
  final String imagePATH;
  final String subTitle;
  final String price;
  final String pages;
  @override
  Widget build(BuildContext context) {
    Random random = Random();
    double rating = random.nextDouble() * 10;
    return Container(
      margin: EdgeInsets.only(right: 16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 125.h,
            width: 92.w,
            margin: EdgeInsets.only(bottom: 15.h),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(1.r),
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
          SizedBox(width: 12.h),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.mulish(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  subTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.mulish(
                    fontWeight: FontWeight.w500,
                    fontSize: 13.sp,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  "by $author",
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.mulish(
                    fontWeight: FontWeight.normal,
                    color: AppColors.greyText,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    // Text(
                    //   "₹$price",
                    //   overflow: TextOverflow.ellipsis,
                    //   style: GoogleFonts.mulish(
                    //     fontWeight: FontWeight.normal,
                    //     color: AppColors.textColor,
                    //     fontSize: 14.sp,
                    //   ),
                    // ),
                    // SizedBox(width: 30.w),
                    SvgPicture.asset(
                      AppImages.startIcon,
                      width: 15.w,
                      height: 15.w,
                    ),
                    Text(
                      "${rating.toStringAsFixed(1)}/10",
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.mulish(
                        fontWeight: FontWeight.normal,
                        color: AppColors.lightText,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
