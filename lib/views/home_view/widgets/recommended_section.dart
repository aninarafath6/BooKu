import 'package:flutter/material.dart';

//? external packages
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

//?? internal packages
import 'package:machine_test/common/widgets/custom_header.dart';
import 'package:machine_test/controllers/home_controller.dart';
import 'package:machine_test/views/home_view/widgets/recommended_book_tile.dart';

class RecommendedSection extends StatelessWidget {
  static final HomeController _homeController = Get.put(HomeController());

  const RecommendedSection({
    super.key,
    this.title = 'Recommended',
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: CustomHeader(
            title: title,
          ),
        ),
        SizedBox(height: 17.w),
        Obx(() {
          return Padding(
            padding: EdgeInsets.only(left: 24.w),
            child: SizedBox(
              height: 300.h,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return RecommendedBookTile(
                    book: _homeController.books[index],
                  );
                },
                itemCount: _homeController.books.length ~/ 2,
                scrollDirection: Axis.horizontal,
              ),
            ),
          );
        })
      ],
    );
  }
}


// [
                //   RecommendedBookTile(
                //     imagePATH:
                //         "http://books.google.com/books/content?id=I9TBDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
                //     title: "Beginning App Development with Flutter",
                //     author: '${_homeController.a}',
                //   ),
                //   RecommendedBookTile(
                //     imagePATH:
                //         "http://books.google.com/books/content?id=PrpJwgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api",
                //     title: "Action in Flutter",
                //     author: "Eric Windmill",
                //   ),
                //   RecommendedBookTile(
                //     imagePATH:
                //         "http://books.google.com/books/content?id=ex-tDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
                //     title: "A Hands On Guide to App Development",
                //     author: "Marco L. Napoli",
                //   ),
                //   RecommendedBookTile(
                //     imagePATH:
                //         "http://books.google.com/books/content?id=9rSlDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
                //     title: "Flutter: Zero to App",
                //     author: "Pouya Hosseini",
                //   ),
                //   RecommendedBookTile(
                //     imagePATH:
                //         "http://books.google.com/books/content?id=junbDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
                //     title:
                //         "A practical, project-based guide to building real-world cross-platform mobile applications and games",
                //     author: "Simone Alessandria",
                //   ),
                //   RecommendedBookTile(
                //     imagePATH:
                //         "http://books.google.com/books/content?id=zDE0EAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
                //     title:
                //         "A practical, project-based guide to building real-world cross-platform mobile applications and games",
                //     author: "Simone Alessandria",
                //   ),
                // ],