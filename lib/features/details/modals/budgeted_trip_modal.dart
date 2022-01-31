import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/core/theme/app_theme.dart';

class BudgetedTripModal {
  void showBudgetedTripModal({ required BuildContext context, required int indexTabBarDetails}){

    String titleBudgetTripModal = '';
    String titleButtonBudgetTripModal = '';

    switch (indexTabBarDetails) {
      case 0:
        titleBudgetTripModal = 'Viagem Orçada'; 
        titleButtonBudgetTripModal = 'Nova Viagem';
        break;
      case 1:
        titleBudgetTripModal = 'Viagem Prevista'; 
        titleButtonBudgetTripModal = 'Próxima Viagem';
        break;
      case 2:
        titleBudgetTripModal = 'Viagem Realizada'; 
        titleButtonBudgetTripModal = 'Iniciar Viagem';
        break;
    }

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
          Container(
            width: MediaQuery.of(context).size.width * 1,
            height: 76,
            child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Center(
                child: Column(
                  children: [
                    Text(titleBudgetTripModal, style: AppTheme.textStyles.titleWhite),
                    Text("16/02/2021 10:09:12", style: AppTheme.textStyles.subTitleWhite)
                  ],
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xFF18984B),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32.r),
                topRight: Radius.circular(32.r),
              )
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 70, right: 70),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("ID Viagem", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("4562.211216.100900")
              ],
            ),
          ),
          SizedBox(height: 60),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Row(
              children: [
                Icon(Icons.share),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text("Compartilhar"),
                ),
                Spacer(),
                Icon(Icons.home),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text("Tela Inicial"),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Material(
              borderRadius: BorderRadius.circular(12.0),
              color: AppTheme.colors.primary,
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.directions, color: Color(0xFFFFFFFF)),
                      SizedBox(width: 5),
                      Text(titleButtonBudgetTripModal, style: TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  )
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}