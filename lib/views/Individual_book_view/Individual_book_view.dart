import 'dart:math';
import 'package:flutter/material.dart';

//? external packages
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

//? internal packages
import 'package:machine_test/common/constants/color_constants.dart';
import 'package:machine_test/common/constants/image_constants.dart';
import 'package:machine_test/controllers/home_controller.dart';
import 'package:machine_test/models/book_model.dart';
import 'package:machine_test/views/Individual_book_view/widgets/app_bar.dart';
import 'package:machine_test/views/Individual_book_view/widgets/custom_chip.dart';
import 'package:machine_test/views/Individual_book_view/widgets/detail_ta.dart';
import 'package:machine_test/views/home_view/widgets/recommended_section.dart';

class IndividualBookView extends StatefulWidget {
  const IndividualBookView({super.key, required this.book});
  final BookItem book;

  @override
  State<IndividualBookView> createState() => _IndividualBookViewState();
}

class _IndividualBookViewState extends State<IndividualBookView> {
  static final HomeController _controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    Random random = Random();
    double rating = random.nextDouble() * 10;
    bool readMore = false;
    return Scaffold(
      appBar: IndividualAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 260.h,
                      width: 180.w,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        // color: const Color(0xFF66BB6A),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.shadowColor.withOpacity(.2),
                              blurRadius: 30.0,
                              offset: Offset(10, 20)),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(3.r),
                        child: Hero(
                          transitionOnUserGestures: true,
                          tag: widget.book.id,
                          child: Image.network(
                            widget.book.volumeInfo.imageLinks.thumbnail,
                            fit: BoxFit.contain,
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          widget.book.volumeInfo.title,
                          style: GoogleFonts.merriweather(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w800,
                            fontSize: 22.sp,
                          ),
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () =>
                              _controller.setBookMarked(widget.book),
                          icon: SvgPicture.asset(
                            'assets/svgs/book_mark_ns.svg',
                            // ignore: deprecated_member_use
                            color: AppColors.textColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppImages.startIcon,
                        width: 15.w,
                        height: 15.w,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        "${rating.toStringAsFixed(1)}/10  GoodReads",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.mulish(
                          fontWeight: FontWeight.normal,
                          color: AppColors.lightText,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.w),
                  Wrap(
                    children: [
                      CustomChip(
                        label: widget.book.saleInfo.isEbook
                            ? "E-Book"
                            : "Hard Copy",
                      ),
                      const CustomChip(
                        label: "Computers",
                      ),
                      CustomChip(label: widget.book.saleInfo.country.name),
                    ],
                  ),
                  SizedBox(height: 15.w),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        DetailTa(
                            title: "Language",
                            value: widget.book.volumeInfo.language.name),
                        DetailTa(
                            title: "Author",
                            value: widget.book.volumeInfo.authors[0]),
                        DetailTa(
                          title: "Publisher ",
                          value: widget.book.volumeInfo.publisher ??
                              "Arthur Samual",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25.w),
                  Text(
                    "Description",
                    style: GoogleFonts.merriweather(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 10.w),
                  Wrap(
                    children: [
                      Text(
                        widget.book.volumeInfo.description,
                        maxLines: readMore == true ? 100 : 15,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.mulish(
                          color: AppColors.lightText,
                          fontWeight: FontWeight.normal,
                          wordSpacing: 2,
                          height: 1.7.h,
                          fontSize: 14.sp,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            readMore = true;
                          });
                        },
                        child: Text(
                          "Read More",
                          maxLines: 15,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.mulish(
                            color: AppColors.blueTint,
                            fontWeight: FontWeight.w500,
                            wordSpacing: 2,
                            height: 1.7.h,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            const RecommendedSection(
              title: "Suggested for you ",
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
