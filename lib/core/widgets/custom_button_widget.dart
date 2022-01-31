import 'package:flutter/material.dart';

import '/core/theme/app_theme.dart';

class CustomButtonWidget extends StatelessWidget {
  final String label;
  final Function() onTap;
  const CustomButtonWidget({Key? key, required this.label, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12.0),
      color: AppTheme.colors.primary,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 65,
          child: Center(
            child: Text(label, style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
        ),
      ),
    );
  }
}
