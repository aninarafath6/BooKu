import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:machine_test/common/constants/color_constants.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({super.key, required this.label});

  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2.w),
      padding: const EdgeInsets.all(8.0),
      child: Chip(
        label: Text(
          label,
          style: GoogleFonts.mulish(color: AppColors.blueTint),
        ),
        backgroundColor: const Color(0xffDBE3FF),
      ),
    );
  }
}
