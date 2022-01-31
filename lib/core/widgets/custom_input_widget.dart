import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/core/theme/app_theme.dart';

class CustomInputWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final bool obscure;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const CustomInputWidget({
    Key? key,
    required this.label,
    required this.hintText,
    this.obscure = false,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.suffixIcon,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 12),
        TextFormField(
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          onChanged: onChanged,
          validator: validator,
          obscureText: obscure,
          controller: controller,
          style: AppTheme.textStyles.input,
          decoration: InputDecoration(
            hintStyle: AppTheme.textStyles.hint,
            hintText: hintText,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppTheme.colors.border),
            ),
          ),
        )
      ],
    );
  }
}
