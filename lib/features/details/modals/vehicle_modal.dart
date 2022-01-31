import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '/core/theme/app_theme.dart';

import '/features/details/controller/details_controller.dart';

class VehicleModal {
  void showVehicleModal({ required BuildContext context}){

    final List<String> vehicleData = ["Moto", "Pecape (Com capota)", "Furgão Compacto", "Furgão", "Veículo Urbano de Carga", "Caminhão Semipesado (toco)", "Caminhão Pesado (truck)"];
    final List<String> vehicleAttributes = ["Até 50 kg", "Até 765 kg", "Até 800 kg", "Até 1600 kg", "Até 3 t", "Até 6 t", "Até 14 t"];
    final detailsController = Provider.of<DetailsController>(context, listen: false);

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
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
            child: Column(
              children: [
                Image.asset(AppTheme.appImages.appVehicles, width: MediaQuery.of(context).size.width * 0.7),
                SizedBox(height: 10),
                Text("Esse veículo é...", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: vehicleData.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
                  child: GestureDetector(
                    child: Container(
                      width: 350,
                      height: 64,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(vehicleData[index]),
                            Text(vehicleAttributes[index]),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0.r),
                        border: Border.fromBorderSide(BorderSide(color: AppTheme.colors.border, width: 2.w)),
                        color: AppTheme.colors.background,
                      ),
                    ),
                    onTap: (){
                      detailsController.onChangeVehicle(vehicle: vehicleData[index], capacity: '100 m²');
                      Navigator.pop(context);
                    }
                  ),
                );
              },
            ),
          ),
        ],
      )
    );
  }
}