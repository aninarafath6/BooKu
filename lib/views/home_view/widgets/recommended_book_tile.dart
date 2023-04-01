import 'package:flutter/material.dart';

//?? external packages
import 'package:flutter_screenutil/flutter_screenutil.dart';

//? internal packages
import 'package:google_fonts/google_fonts.dart';
import 'package:machine_test/common/constants/color_constants.dart';
import 'package:machine_test/models/book_model.dart';
import 'package:machine_test/views/Individual_book_view/Individual_book_view.dart';

class RecommendedBookTile extends StatelessWidget {
  const RecommendedBookTile({
    super.key,
    required this.book,
  });
  final BookItem book;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 143.w,
      margin: EdgeInsets.only(right: 16.w),
      child: InkWell(
        borderRadius: BorderRadius.circular(10.r),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => IndividualBookView(
                    book: book,
                  )));
        },
        child: Padding(
          padding: EdgeInsets.all(4.w),
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
                    book.volumeInfo.imageLinks.thumbnail,
                    fit: BoxFit.cover,
                    alignment: Alignment.centerLeft,
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                book.volumeInfo.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.mulish(
                    fontWeight: FontWeight.bold, fontSize: 14.sp),
              ),
              SizedBox(height: 6.h),
              Text(
                "- ${book.volumeInfo.authors[0]}",
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.mulish(
                  fontWeight: FontWeight.normal,
                  color: AppColors.greyText,
                  fontSize: 12.sp,
                ),
              ),
              // SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
