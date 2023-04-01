//?? builtin packages
import 'package:flutter/material.dart';
import 'dart:math';

//?? external packages
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

//?? internal packages
import 'package:machine_test/common/constants/color_constants.dart';
import 'package:machine_test/common/constants/image_constants.dart';
import 'package:machine_test/models/book_model.dart';
import 'package:machine_test/views/Individual_book_view/Individual_book_view.dart';

class BookTile extends StatelessWidget {
  const BookTile({
    super.key,
    required this.book,
  });
  final BookItem book;
  @override
  Widget build(BuildContext context) {
    Random random = Random();
    double rating = random.nextDouble() * 10;
    return Container(
      margin: EdgeInsets.only(right: 16.w, bottom: 15.h),
      // margin: EdgeInsets.only(bottom: 15.h),
      child: InkWell(
        borderRadius: BorderRadius.circular(3.r),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => IndividualBookView(
                    book: book,
                  )));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 125.h,
              width: 92.w,
              color: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(3.r),
                child: Hero(
                  transitionOnUserGestures: true,
                  tag: book.id,
                  child: Image.network(
                    book.volumeInfo.imageLinks.thumbnail,
                    fit: BoxFit.cover,
                    alignment: Alignment.centerLeft,
                  ),
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
                    book.volumeInfo.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.mulish(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    book.volumeInfo.subtitle ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    "by ${book.volumeInfo.authors[0]}",
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
      ),
    );
  }
}
