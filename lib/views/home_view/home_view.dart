import 'package:flutter/material.dart';

//? external packages
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:machine_test/common/constants/color_constants.dart';

//? Internal packages
import 'package:machine_test/views/home_view/widgets/bg_overlay.dart';
import 'package:machine_test/views/home_view/widgets/book_tile.dart';
import 'package:machine_test/views/home_view/widgets/home_app_bar.dart';
import 'package:machine_test/common/widgets/custom_header.dart';
import 'package:machine_test/views/home_view/widgets/recommended_book_tile.dart';
import 'package:machine_test/views/home_view/widgets/recommended_section.dart';

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
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: homeAppBar(),
                ),
                SizedBox(height: 16.h),
                const RecommendedSection(),
                SizedBox(height: 10.h),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      children: [
                        const CustomHeader(title: "Popular Books"),
                        SizedBox(height: 17.w),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: const [
                                BookTile(
                                  imagePATH:
                                      "http://books.google.com/books/content?id=junbDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
                                  title:
                                      "A practical, project-based guide to building real-world cross-platform mobile applications and games",
                                  author: "Simone Alessandria",
                                  price: "400.1",
                                  pages: "900",
                                  subTitle:
                                      "An introductory guide to building cross-platform mobile applications with Flutter and Dart 2",
                                ),
                                BookTile(
                                  imagePATH:
                                      "http://books.google.com/books/content?id=pF6vDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
                                  title: "Flutter for Beginners",
                                  author: "Alessandro Biessek",
                                  price: "400.1",
                                  pages: "900",
                                  subTitle:
                                      "An introductory guide to building cross-platform mobile applications with Flutter and Dart 2",
                                ),
                                BookTile(
                                  imagePATH:
                                      "http://books.google.com/books/content?id=zDE0EAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
                                  title:
                                      "A practical, project-based guide to building real-world cross-platform mobile applications and games",
                                  author: "Simone Alessandria",
                                  price: "400.1",
                                  pages: "900",
                                  subTitle:
                                      "An introductory guide to building cross-platform mobile applications with Flutter and Dart 2",
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
