import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/core/theme/app_theme.dart';

class MessageSuccessModal {
  void showMessageSuccessModal({ required BuildContext context, required String message}){

    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.r),
          topRight: Radius.circular(32.r),
        ),
      ),
      builder: (context) => Column(
        children: [
          SizedBox(height: 40),
          Icon(Icons.check_circle, color: AppTheme.colors.titleSuccess, size: 100,),
          SizedBox(height: 60),
          Text(message, style: AppTheme.textStyles.titleSuccess),
        ],
      )
    );
  }
}