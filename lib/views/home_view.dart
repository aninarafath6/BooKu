import 'package:flutter/material.dart';
import 'package:machine_test/common/constants/color_constants.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width:double.infinity,
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration:  BoxDecoration(
                      color: AppColors.overlayColor.withOpacity(.09)
                    ),
                  ),
                ),
                Expanded(
                  flex:2,
                  child: Container(
                    decoration: const BoxDecoration(

                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: const[
                Center(child: Text("Hi"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
