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
                    book: (_homeController.recommendedBooks[index]),
                  );
                },
                itemCount: _homeController.recommendedBooks.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
          );
        })
      ],
    );
  }
}
