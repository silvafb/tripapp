import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/core/theme/app_theme.dart';

class VolumeFormDetailsWidget extends StatelessWidget {
  const VolumeFormDetailsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(FontAwesomeIcons.box, color: AppTheme.colors.icon, size: 18),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("Volumes"),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("(0000)"),
          ),
          Spacer(),
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.camera_alt, color: Color(0xFF186CDA)),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/qrcodescanner');
            },
          ),
          Text("Ler Volumes", style: TextStyle(color: Color(0xFF186CDA), fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}