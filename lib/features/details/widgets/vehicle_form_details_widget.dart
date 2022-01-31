import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '/features/details/controller/details_controller.dart';
import '/features/details/modals/vehicle_modal.dart';

import '/core/theme/app_theme.dart';

class VehicleFormDetailsWidget extends StatefulWidget {

  @override
  State<VehicleFormDetailsWidget> createState() => _VehicleFormDetailsWidgetState();
}

class _VehicleFormDetailsWidgetState extends State<VehicleFormDetailsWidget> {
  final vehicleModal = VehicleModal();

  @override
  Widget build(BuildContext context) {

    final detailsController = Provider.of<DetailsController>(context);

    return Observer(
      builder: (_){
        return Container(
          width: 380,
          height: 108,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.local_shipping, color: AppTheme.colors.icon),
                    Padding(
                      padding: EdgeInsets.only(left: 10.r),
                      child: Text("Veiculo"),
                    ),
                    Spacer(),
                    GestureDetector(
                      child: Container(
                        width: 210.w,
                        height: 42,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  detailsController.vehicleDetails, 
                                  style: TextStyle(
                                    color: (detailsController.indexTabBarDetailsPage == 2) ? Color(0xFF9E9E9E) : Colors.black,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              Icon(Icons.arrow_drop_down, color: (detailsController.indexTabBarDetailsPage == 2) ? Colors.grey[400] : Colors.black),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0.r),
                          border: Border.fromBorderSide(BorderSide(color: AppTheme.colors.border, width: 2.w)),
                          color: (detailsController.indexTabBarDetailsPage == 2) ? Color(0xFFEEEEEE) : AppTheme.colors.background,
                        ),
                      ),
                      onTap: (detailsController.indexTabBarDetailsPage == 2) ? null : () => vehicleModal.showVehicleModal(context: context),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.line_weight, color: AppTheme.colors.icon),
                    Padding(
                      padding: EdgeInsets.only(left: 10.r),
                      child: Text("Capacidade"),
                    ),
                    Spacer(),
                    Text("${detailsController.vehicleCapacity}"),
                  ],
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
    );
  }
}