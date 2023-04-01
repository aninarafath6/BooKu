import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar IndividualAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    ),
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
  );
}
