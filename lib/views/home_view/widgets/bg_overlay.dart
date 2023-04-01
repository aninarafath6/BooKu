import 'package:flutter/material.dart';
import 'package:machine_test/common/constants/color_constants.dart';

class BgOverlay extends StatelessWidget {
  const BgOverlay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration:
                BoxDecoration(color: AppColors.strokeColor.withOpacity(.6)),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            decoration: const BoxDecoration(),
          ),
        ),
      ],
    );
  }
}
