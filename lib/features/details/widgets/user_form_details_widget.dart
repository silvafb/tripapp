import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/core/theme/app_theme.dart';

class UserFormDetailsWidget extends StatelessWidget {
  const UserFormDetailsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 64,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.person, color: AppTheme.colors.icon),
            Padding(
              padding: EdgeInsets.only(left: 10.r),
              child: Text("Usuário(a)"),
            ),
            Spacer(),
            Column(
              children: [
                Text("Emanuel Marcos Vinicius"),
                Text("16/12/2021 - 09:48:00"),
              ],
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0.r),
        border: Border.fromBorderSide(BorderSide(color: AppTheme.colors.border, width: 2.w)),
        color: AppTheme.colors.background,
      ),
    );
  }
}