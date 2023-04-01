import 'dart:math';
import 'package:flutter/material.dart';

//? external packages
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

//? internal packages
import 'package:machine_test/common/constants/color_constants.dart';
import 'package:machine_test/common/constants/image_constants.dart';
import 'package:machine_test/views/Individual_book_view/widgets/app_bar.dart';
import 'package:machine_test/views/Individual_book_view/widgets/custom_chip.dart';
import 'package:machine_test/views/Individual_book_view/widgets/detail_ta.dart';
import 'package:machine_test/views/home_view/widgets/recommended_section.dart';

class IndividualBookView extends StatefulWidget {
  const IndividualBookView({super.key});

  @override
  State<IndividualBookView> createState() => _IndividualBookViewState();
}

class _IndividualBookViewState extends State<IndividualBookView> {
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
                        child: Image.network(
                          "http://books.google.com/books/content?id=ex-tDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
                          fit: BoxFit.contain,
                          alignment: Alignment.centerLeft,
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
                          "Flutter Complete Reference",
                          style: GoogleFonts.merriweather(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w800,
                            fontSize: 22.sp,
                          ),
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {},
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
                    children: const [
                      CustomChip(label: "E-Book"),
                      CustomChip(label: "Computers"),
                      CustomChip(label: "Not Mature"),
                    ],
                  ),
                  SizedBox(height: 15.w),
                  Wrap(
                    children: const [
                      DetailTa(title: "Language", value: "English"),
                      DetailTa(title: "Author", value: "Rap Payne"),
                      DetailTa(title: "Publisher ", value: "Apress"),
                    ],
                  ),
                  SizedBox(height: 20.w),
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
                        "Create iOS and Android apps with Flutter using just one codebase. App development on multiple platforms has historically been difficult and complex. This book breaks down complex concepts and tasks into easily digestible segments with examples, pictures, and hands-on labs with starters and solutions. In doing so, you'll develop a basic understanding of the Dart programming language; the entire Flutter development toolchain; the differences between stateful and stateless widgets; and a working knowledge of the architecture of apps. All the most important parts of app development with Flutter are covered in this book. Work with themes and styles. Develop custom widgets. Teach your app to respond to gestures like taps, swipes, and pinches. Design, create and control the layout of your app. Create tools to handle form data entry from users. And ultimately create killer multiscreen apps with navigation, menus, and tabs. Flutter is Google's new framework for creating mobile apps that run on iOS and Android phones both.You had to be a super-developer to write apps for iOS or Android alone. But writing for both? Forget about it! You had to be familiar with Swift, Java/Kotlin, Xcode, Eclipse, and a bunch of other technologies simultaneously. Beginning App Development with Flutter simplifies the entire process. What You'll Learn Get the most out of great Flutter widgets Create custom widgets, both stateless and statefulExercise expert control over your Flutter layoutsMake your app respond to gestures like swiping, pinching and tappingInitiate async Ajax calls to RESTful APIs — including Google Firebase! Who This Book Is ForDevelopers who have coded in Java, C#, C++, or any similar language. It brings app development within the reach of younger developers, so STEM groups are likely to pick up the technology. Managers, product owners, and business analysts need to understand Flutter's capabilities.",
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
