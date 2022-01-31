import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '/core/theme/app_theme.dart';

import '/features/details/controller/details_controller.dart';

class CarrierFormDetailsWidget extends StatelessWidget {
  const CarrierFormDetailsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final detailsController = Provider.of<DetailsController>(context);
    
    return Container(
      width: 380,
      height: 64,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.airline_seat_recline_extra, color: AppTheme.colors.icon),
            Padding(
              padding: EdgeInsets.only(left: 10.r),
              child: Text("Portador(a)"),
            ),
            Spacer(),
            Container(
              width: 175,
              height: 42,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  width: 165,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Insira o nome',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontSize: 15.sp,
                        color: (detailsController.indexTabBarDetailsPage == 2) ? Color(0xFF9E9E9E) : Colors.black,
                      ),
                    ),
                    onChanged: (value) => detailsController.onChangeCarrier(value),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0.r),
                border: Border.fromBorderSide(BorderSide(color: AppTheme.colors.border, width: 2.w)),
                color: (detailsController.indexTabBarDetailsPage == 2) ? Color(0xFFEEEEEE) : AppTheme.colors.background,
              ),
            ),
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