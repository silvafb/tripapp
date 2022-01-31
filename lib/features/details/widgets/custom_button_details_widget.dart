import 'package:flutter/material.dart';

class CustomButtonDetailsWidget extends StatelessWidget {
  final String label;
  final Function() onTap;
  const CustomButtonDetailsWidget({Key? key, required this.label, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12.0),
      color: Color(0xFF186CDA),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 40,
          width: 100,
          child: Center(
            child: Text(label, style: TextStyle(color: Colors.white, fontSize: 14)),
          ),
        ),
      ),
    );
  }
}
