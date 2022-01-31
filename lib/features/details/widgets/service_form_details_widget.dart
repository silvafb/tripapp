import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '/core/theme/app_theme.dart';
import '/features/details/controller/details_controller.dart';

class ServiceFormDetailsWidget extends StatefulWidget {
  const ServiceFormDetailsWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ServiceFormDetailsWidget> createState() => _ServiceFormDetailsWidgetState();
}

class _ServiceFormDetailsWidgetState extends State<ServiceFormDetailsWidget> {
  String dropdownValue = 'Selecione o serviço';

  @override
  Widget build(BuildContext context) {

    final detailsController = Provider.of<DetailsController>(context);

    return Observer(
      builder: (_){
        return Container(
          width: 380,
          height: 64,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.miscellaneous_services, color: AppTheme.colors.icon),
                Padding(
                  padding: EdgeInsets.only(left: 10.r),
                  child: Text("Serviço"),
                ),
                Spacer(),
                Container(
                  width: 210.w,
                  height: 42,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DropdownButton<String>(
                          value: dropdownValue,
                          icon: Icon(Icons.arrow_drop_down),
                          elevation: 16,
                          style: TextStyle(color: Colors.black, fontSize: 13),
                          underline: Container(),
                          onChanged: (detailsController.indexTabBarDetailsPage == 1 || detailsController.indexTabBarDetailsPage == 2) ? null : (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: <String>['Selecione o serviço', 'Coleta', 'Entrega', 'Transferência']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0.r),
                    border: Border.fromBorderSide(BorderSide(color: AppTheme.colors.border, width: 2.w)),
                    color: (detailsController.indexTabBarDetailsPage == 1 || detailsController.indexTabBarDetailsPage == 2) ? Color(0xFFEEEEEE) :  AppTheme.colors.background,
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
      },
    );
  }
}