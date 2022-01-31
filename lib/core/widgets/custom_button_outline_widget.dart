import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/core/theme/app_theme.dart';

class CustomButtonOutlineWidget extends StatelessWidget {
  final String label;
  final Function() onTap;
  const CustomButtonOutlineWidget({Key? key, required this.label, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0.r),
          border: Border.fromBorderSide(BorderSide(color: AppTheme.colors.border, width: 2.w)),
          color: AppTheme.colors.background,
        ),
        child: Center(
          child: Text(label),
        ),
      ),
    );
  }
}
