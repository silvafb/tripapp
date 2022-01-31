// ignore_for_file: must_call_super

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '/features/settings_qrcode_scanner/controllers/settings_qrcode_scanner_controller.dart';

import '/core/theme/app_theme.dart';
import '/core/widgets/custom_button_widget.dart';
import '/core/widgets/loading_widget.dart';
import '/core/modals/modals.dart';

class SettingsQrCodeScannerPage extends StatefulWidget {
  const SettingsQrCodeScannerPage({ Key? key }) : super(key: key);

  @override
  _SettingsQrCodeScannerPageState createState() => _SettingsQrCodeScannerPageState();
}

class _SettingsQrCodeScannerPageState extends State<SettingsQrCodeScannerPage> {

  final messageSuccessModal = MessageSuccessModal();
  final messageErrorModal = MessageErrorModal();

  @override
  Widget build(BuildContext context) {
    
    final settingsQrcodeScannerController = Provider.of<SettingsQrCodeScannerController>(context);

    return Observer(
      builder: (_){
        return Scaffold(
          appBar: AppBar(
            title: Text('Configurações', style: TextStyle(color: Color(0xFF000000))),
            iconTheme: IconThemeData(color: Color(0xFF000000)),
            elevation: 1.0,
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(left: 10, top: 40, right: 10,),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Câmera", style: AppTheme.textStyles.hint),
                        SizedBox(width: 20),
                        Container(
                          width: 285,
                          child: Divider(height: 10, thickness: 1, color: Color(0xFFA4A4A4)),
                        ),
                        Icon(Icons.arrow_drop_down_sharp)
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Text("Vibrar ao fazer leitura", style: AppTheme.textStyles.label),
                        ),
                        Transform.scale(
                          scale: 0.6,
                          child: CupertinoSwitch(
                            trackColor: Color(0xFFA3A3A3),
                            activeColor: Color(0xFF5CA6EA),
                            value: settingsQrcodeScannerController.vibration,
                            onChanged: (bool value) {
                              settingsQrcodeScannerController.vibration = value;
                              settingsQrcodeScannerController.settingsModel.vibration = value;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Text("Emitir som ao fazer leitura", style: AppTheme.textStyles.label),
                        ),
                        Transform.scale(
                          scale: 0.6,
                          child: CupertinoSwitch(
                            trackColor: Color(0xFFA3A3A3),
                            activeColor: Color(0xFF5CA6EA),
                            value: settingsQrcodeScannerController.soundReading,
                            onChanged: (bool value) {
                              settingsQrcodeScannerController.soundReading = value;
                              settingsQrcodeScannerController.settingsModel.soundReading = value;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Text("Linhas de grade para captura", style: AppTheme.textStyles.label),
                        ),
                        Transform.scale(
                          scale: 0.6,
                          child: CupertinoSwitch(
                            trackColor: Color(0xFFA3A3A3),
                            activeColor: Color(0xFF5CA6EA),
                            value: settingsQrcodeScannerController.gridlines,
                            onChanged: (bool value) {
                              settingsQrcodeScannerController.gridlines = value;
                              settingsQrcodeScannerController.settingsModel.gridlines = value;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Text("Bipagem consecutiva", style: AppTheme.textStyles.label),
                        ),
                        Transform.scale(
                          scale: 0.6,
                          child: CupertinoSwitch(
                            trackColor: Color(0xFFA3A3A3),
                            activeColor: Color(0xFF5CA6EA),
                            value: settingsQrcodeScannerController.beep,
                            onChanged: (bool value) {
                              settingsQrcodeScannerController.beep = value;
                              settingsQrcodeScannerController.settingsModel.beep = value;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Text("Permitir leitura de código duplicado", style: AppTheme.textStyles.label),
                        ),
                        Transform.scale(
                          scale: 0.6,
                          child: CupertinoSwitch(
                            trackColor: Color(0xFFA3A3A3),
                            activeColor: Color(0xFF5CA6EA),
                            value: settingsQrcodeScannerController.duplicateCode,
                            onChanged: (bool value) {
                              settingsQrcodeScannerController.duplicateCode = value;
                              settingsQrcodeScannerController.settingsModel.duplicateCode = value;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    !settingsQrcodeScannerController.isLoading ? CustomButtonWidget(
                      label: 'Salvar',
                      onTap: () async {
                        await settingsQrcodeScannerController.setSettingsQrCodeScanner().then((value) {
                          if(value) {
                            messageSuccessModal.showMessageSuccessModal(context: context, message: "Dados salvos com \n Sucesso !");
                          }else{
                            messageErrorModal.showMessageErrorModal(context: context, message: 'Falha ao gravar dados');
                          }
                        });
                      },
                    ) : LoadingComponent()
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}