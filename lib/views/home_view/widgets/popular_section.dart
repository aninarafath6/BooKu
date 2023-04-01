import 'package:flutter/material.dart';

//?? external packages
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

//?? internal packages
import 'package:machine_test/common/widgets/custom_header.dart';
import 'package:machine_test/controllers/home_controller.dart';
import 'package:machine_test/models/book_model.dart';
import 'package:machine_test/utils/shuffle.dart';
import 'package:machine_test/views/home_view/widgets/book_tile.dart';

class PopularSection extends StatelessWidget {
  const PopularSection({
    super.key,
  });

  static final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          const CustomHeader(title: "Popular Books"),
          SizedBox(height: 17.w),
          Obx(() {
            return Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  _homeController.books;
                  return BookTile(
                    book: _homeController.popularBooks[index],
                  );
                },
                itemCount: _homeController.popularBooks.length,
              ),
            );
          }),
        ],
      ),
    );
  }
}
  // BookTile(
  //                 imagePATH:
  //                     "http://books.google.com/books/content?id=junbDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
  //                 title:
  //                     "A practical, project-based guide to building real-world cross-platform mobile applications and games",
  //                 author: "Simone Alessandria",
  //                 price: "400.1",
  //                 pages: "900",
  //                 subTitle:
  //                     "An introductory guide to building cross-platform mobile applications with Flutter and Dart 2",
  //               ),
  //               BookTile(
  //                 imagePATH:
  //                     "http://books.google.com/books/content?id=pF6vDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
  //                 title: "Flutter for Beginners",
  //                 author: "Alessandro Biessek",
  //                 price: "400.1",
  //                 pages: "900",
  //                 subTitle:
  //                     "An introductory guide to building cross-platform mobile applications with Flutter and Dart 2",
  //               ),
  //               BookTile(
  //                 imagePATH:
  //                     "http://books.google.com/books/content?id=zDE0EAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
  //                 title:
  //                     "A practical, project-based guide to building real-world cross-platform mobile applications and games",
  //                 author: "Simone Alessandria",
  //                 price: "400.1",
  //                 pages: "900",
  //                 subTitle:
  //                     "An introductory guide to building cross-platform mobile applications with Flutter and Dart 2",
  //               ),
  //               BookTile(
  //                 imagePATH:
  //                     "http://books.google.com/books/content?id=zDE0EAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
  //                 title:
  //                     "A practical, project-based guide to building real-world cross-platform mobile applications and games",
  //                 author: "Simone Alessandria",
  //                 price: "400.1",
  //                 pages: "900",
  //                 subTitle:
  //                     "An introductory guide to building cross-platform mobile applications with Flutter and Dart 2",
  //               ),
  //               BookTile(
  //                 imagePATH:
  //                     "http://books.google.com/books/content?id=zDE0EAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
  //                 title:
  //                     "A practical, project-based guide to building real-world cross-platform mobile applications and games",
  //                 author: "Simone Alessandria",
  //                 price: "400.1",
  //                 pages: "900",
  //                 subTitle:
  //                     "An introductory guide to building cross-platform mobile applications with Flutter and Dart 2",
  //               ),
  //               BookTile(
  //                 imagePATH:
  //                     "http://books.google.com/books/content?id=zDE0EAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
  //                 title:
  //                     "A practical, project-based guide to building real-world cross-platform mobile applications and games",
  //                 author: "Simone Alessandria",
  //                 price: "400.1",
  //                 pages: "900",
  //                 subTitle:
  //                     "An introductory guide to building cross-platform mobile applications with Flutter and Dart 2",
  //               ),
  //               BookTile(
  //                 imagePATH:
  //                     "http://books.google.com/books/content?id=zDE0EAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
  //                 title:
  //                     "A practical, project-based guide to building real-world cross-platform mobile applications and games",
  //                 author: "Simone Alessandria",
  //                 price: "400.1",
  //                 pages: "900",
  //                 subTitle:
  //                     "An introductory guide to building cross-platform mobile applications with Flutter and Dart 2",
  //               ),
  //               BookTile(
  //                 imagePATH:
  //                     "http://books.google.com/books/content?id=zDE0EAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
  //                 title:
  //                     "A practical, project-based guide to building real-world cross-platform mobile applications and games",
  //                 author: "Simone Alessandria",
  //                 price: "400.1",
  //                 pages: "900",
  //                 subTitle:
  //                     "An introductory guide to building cross-platform mobile applications with Flutter and Dart 2",
  //               ),