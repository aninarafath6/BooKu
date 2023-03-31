import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key, required this.iconPATH, this.splashRadius = 30});

  final String iconPATH;
  final double splashRadius;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 20.w,
      onPressed: () => {},
      icon: SvgPicture.asset(
        iconPATH,
        width: splashRadius.w,
        height: splashRadius.h,
      ),
    );
  }
}
