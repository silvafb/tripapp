import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '/core/theme/app_theme.dart';

import '/features/details/controller/details_controller.dart';

class UnitFormDetailsWidget extends StatefulWidget {
  const UnitFormDetailsWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<UnitFormDetailsWidget> createState() => _UnitFormDetailsWidgetState();
}

class _UnitFormDetailsWidgetState extends State<UnitFormDetailsWidget> {
  String dropdownValue = 'Selecione a UN';

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
                Icon(Icons.business_center, color: AppTheme.colors.icon),
                Padding(
                  padding: EdgeInsets.only(left: 10.r),
                  child: Text("UN Executora"),
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
                          onChanged: (detailsController.indexTabBarDetailsPage == 2) ? null : (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: <String>["Selecione a UN","ABC-SP","AJU-SE","ALT-SP","AMA-RJ","AME-SP","APS-GO","AQA-SP","ARU-SP","BARUERI-SP","BAU-SP","BET-MG","BETIM-MG","BGP-SP","BHM","BHZ-MG","BIO-SP","BRA-BA","BSB-DF","BSC-DF","CAC-PR","CATALAO","CBU-MG","CCM-SC","CDI-ES","CON-MG","CPS-SP","CRA-SP","CTN-ES","CVL-MG","CWB-PR","DENTAL SPEED - PA","DEVOLUCAO CPS","DIQ-MG","DQC - RJ","FBE-PR","FEC-BA","FLN-SC","FOR-CE","FRC-SP","GNM-BA","GRU-SP","GUJ-SP","GVR-MG","GXP-MG","GYN-GO","HRT-SP","IAV - SP","IGA - SP","IPN - MG ","IRE-BA","ITAPIRA-SP","ITP - RJ","ITU - GO","ITUMBIARA","JANDIRA","JDF - MG","JGN - SP","JMO - MG","JND - SP","JOI - SC","JPS-SP","JUZ-BA","LAF - MG","LDN-PR","LIT-SP","LMR-SP","LOT","LRS - ES","MATRIZ - SP","MCZ-AL","MED-RS","MEDPRESS","MGF-PR","MHU-MG","MII - SP","MOC-MG","MS","MT","NAT-RN","NIT-RJ","NVT-SC","OUS-SP","PA - FF UNIAO MG","PA - SONEPAR ES","PA-SIMPRESS (ITAJAI)","PCT-MG","PDS-MG","PFB - RS","PGZ - PR","PMN - MG","PNV - MG","PNZ-PE","POA-RS","POC - RS","POJ - MG","POO-MG","PPB-SP","PROFARMA - ES","PSO-MG","PUN-SC","PVI-PR","QAK - MG","QSC-SP","QT-SPP","RAO-SP","REC-PE","REG-SP","RIA - RS","RIO-RJ","RJC - RJ","RJN -RJ","RJO - RJ","RJS-RJ","RVD-GO","SBV-SP","SET-MG","SIMPRESS PA","SJK-SP","SJO-SP","SJP-SP","SOD-SP","SPC-SP","SPL-SP","SPM-SP","SPN-SP","SPO-SP","SPP-SP","SPS-SP","SSA-BA","STO-SP","SZO-SP","TQA-SP","TRS-RJ","TSA-SP","TSL-MS","TXF-BA","UDI-MG","VDC-BA","VIC-ES","VIX-ES","VRE-RJ","XAP- SC"]
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
      },
    );
  }
}