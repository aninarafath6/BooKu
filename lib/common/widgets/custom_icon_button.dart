import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key, required this.iconPATH, this.splashRadius = 30, this.onTap});

  final String iconPATH;
  final double splashRadius;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 20.w,
      onPressed: onTap,
      icon: SvgPicture.asset(
        iconPATH,
        width: splashRadius.w,
        height: splashRadius.h,
      ),
    );
  }
}
