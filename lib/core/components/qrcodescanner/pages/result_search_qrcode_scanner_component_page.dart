import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '/core/components/qrcodescanner/controllers/qrcode_scanner_component_controller.dart';
import '/core/theme/app_theme.dart';
import '/core/widgets/custom_button_widget.dart';

import '/features/details/controller/details_controller.dart';

class ResultSearchQrCodeScannerComponentPage extends StatefulWidget {
  const ResultSearchQrCodeScannerComponentPage({ Key? key }) : super(key: key);

  @override
  _ResultSearchQrCodeScannerComponentPageState createState() => _ResultSearchQrCodeScannerComponentPageState();
}

class _ResultSearchQrCodeScannerComponentPageState extends State<ResultSearchQrCodeScannerComponentPage> {

  @override
  Widget build(BuildContext context) {
    final qrcodeScannerComponentController = Provider.of<QrCodeScannerComponentController>(context);
    final detailsController = Provider.of<DetailsController>(context);

    return Observer(
      builder: (_){
        return Scaffold(
          appBar: AppBar(
            title: Text(qrcodeScannerComponentController.titleAppBarResultSearchQrCodeScannerComponent.toUpperCase(), style: TextStyle(color: Color(0xFF000000))),
            iconTheme: IconThemeData(color: Color(0xFF000000)),
            backgroundColor: qrcodeScannerComponentController.colorAppBarResultSearchQrCodeScannerComponent,
          ),
          body: Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 1,
            color: Colors.black.withOpacity(0.5),
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.3),
                    child: Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.40,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: ListView.builder(
                          itemCount: qrcodeScannerComponentController.listVolumesQrCodeScanner.length,
                          itemBuilder: (context, index){
                            if(index == 0) return Text(qrcodeScannerComponentController.listVolumesQrCodeScanner[index], style: TextStyle(color: Color(0xFF5CA6EA)));
                            return Text(qrcodeScannerComponentController.listVolumesQrCodeScanner[index], style: AppTheme.textStyles.subTitleWhite);
                          }
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.4),
                    child: Center(child: Image.asset(AppTheme.appImages.appBoxBeep, width: 200)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.05),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomButtonWidget(
                        label: qrcodeScannerComponentController.titleButtonResultSearchQrCodeScannerComponent.toUpperCase(),
                        onTap: () {
                          if(qrcodeScannerComponentController.isLocated) detailsController.onChangeListVolumesDetails(qrcodeScannerComponentController.lastVolume);
                          Navigator.pop(context);
                        }
                      ),
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