import 'package:flutter/material.dart';

class OccupationFormDetailsWidget extends StatelessWidget {
  const OccupationFormDetailsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Ocupação:", style: TextStyle(fontWeight: FontWeight.bold)),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("(9.999 m²)"),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text("Peso:", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Text("9.00,00 kg")
        ],
      ),
    );
  }
}