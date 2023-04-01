import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

//? external packages
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:machine_test/controllers/home_controller.dart';

//? Internal packages
import 'package:machine_test/views/home_view/widgets/bg_overlay.dart';
import 'package:machine_test/views/home_view/widgets/home_app_bar.dart';
import 'package:machine_test/views/home_view/widgets/popular_section.dart';
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
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: homeAppBar(context),
                  ),
                  Expanded(
                    child: NestedScrollView(
                      physics: const PageScrollPhysics(),
                      dragStartBehavior: DragStartBehavior.down,
                      body: const PopularSection(),
                      headerSliverBuilder: (context, value) => [
                        const SliverToBoxAdapter(
                          child: RecommendedSection(),
                        ),
                      ],
                    ),
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
