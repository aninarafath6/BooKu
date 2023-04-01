import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:machine_test/common/constants/color_constants.dart';
import 'package:machine_test/common/constants/image_constants.dart';
import 'package:machine_test/common/widgets/custom_icon_button.dart';
import 'package:machine_test/controllers/home_controller.dart';
import 'package:machine_test/views/home_view/widgets/book_tile.dart';

class BookmarkView extends StatefulWidget {
  const BookmarkView({super.key});

  @override
  State<BookmarkView> createState() => _BookmarkViewState();
}

class _BookmarkViewState extends State<BookmarkView> {
  static final HomeController _homeController = Get.put(HomeController());

  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _homeController.getBookmarked());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // App Bar title
        title: Text(
          "Book Marked",
          style: GoogleFonts.mulish(
            color: AppColors.textColor,
            fontWeight: FontWeight.w800,
            fontSize: 16.sp,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 60,
        // leading section
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        // right side of the app bar
        actions: [
          IconButton(
            splashRadius: 25,
            onPressed: () => {},
            icon: const Icon(
              Icons.more_horiz,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 15.w,
          )
        ],
      ),
      body: Obx(
        () {
          return _homeController.bookMarked.isEmpty
              ? Center(
                  child: Text(
                    "Nothing to Display",
                    style: GoogleFonts.mulish(fontSize: 12),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.all(24.w),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      // print(_homeController.bookMarked[index]);
                      return BookTile(book: _homeController.bookMarked[index]);
                    },
                    itemCount: _homeController.bookMarked.length,
                  ),
                );
        },
      ),
    );
  }
}
