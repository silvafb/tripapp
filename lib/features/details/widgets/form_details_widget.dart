import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '/features/details/controller/details_controller.dart';
import '/features/details/modals/budgeted_trip_modal.dart';
import '/features/details/widgets/widgets_details.dart';
import '/features/details/widgets/custom_button_details_widget.dart';

import '/core/theme/app_theme.dart';

class FormDetailsWidget extends StatefulWidget {
  const FormDetailsWidget({ Key? key }) : super(key: key);

  @override
  _FormDetailsWidgetState createState() => _FormDetailsWidgetState();
}

class _FormDetailsWidgetState extends State<FormDetailsWidget> {

  final budgetedTripModal = BudgetedTripModal();

  @override
  Widget build(BuildContext context) {

    final detailsController = Provider.of<DetailsController>(context);

    return Observer(
      builder: (_){
        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  UserFormDetailsWidget(),
                  SizedBox(height: 10),
                  ServiceFormDetailsWidget(),
                  SizedBox(height: 10),
                  UnitFormDetailsWidget(),
                  SizedBox(height: 10),
                  VehicleFormDetailsWidget(),
                  SizedBox(height: 10),
                  ValueFormDetailsWidget(),
                  SizedBox(height: 10),
                  CarrierFormDetailsWidget(),
                  SizedBox(height: 15),
                  VolumeFormDetailsWidget(),
                  SizedBox(height: 20),
                  OccupationFormDetailsWidget(),
                  SizedBox(height: 10),
                  Container(
                    width: 380,
                    height: 100,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: detailsController.listVolumes.length,
                        itemBuilder: (context, index){
                          return Text(detailsController.listVolumes[index]);
                        },
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0.r),
                      border: Border.fromBorderSide(BorderSide(color: AppTheme.colors.border, width: 2.w)),
                      color: AppTheme.colors.background,
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      children: [
                        Icon(Icons.share),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text("Compartilhar"),
                        ),
                        Spacer(),
                        CustomButtonDetailsWidget(
                          label: "Salvar",
                          onTap: (){
                            budgetedTripModal.showBudgetedTripModal(context: context, indexTabBarDetails: detailsController.indexTabBarDetailsPage);
                          }
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}