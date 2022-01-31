import 'dart:io';

import 'package:animated_widgets/widgets/translation_animated.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beep/flutter_beep.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech/flutter_speech.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:provider/provider.dart';

import '/core/components/qrcodescanner/controllers/qrcode_scanner_component_controller.dart';
import '/core/widgets/loading_widget.dart';
import '/core/theme/app_theme.dart';

import '/features/details/controller/details_controller.dart';
import '/features/settings_qrcode_scanner/controllers/settings_qrcode_scanner_controller.dart';

const languages = const [
  const Language('Brazil', 'pt_BR'),
];

class Language {
  final String name;
  final String code;
  const Language(this.name, this.code);
}

class QrCodeScannerComponentPage extends StatefulWidget {
  const QrCodeScannerComponentPage({ Key? key }) : super(key: key);

  @override
  _QrCodeScannerComponentPageState createState() => _QrCodeScannerComponentPageState();
}

class _QrCodeScannerComponentPageState extends State<QrCodeScannerComponentPage> {

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  TextEditingController textFormSearchQrCodeScanner = TextEditingController();
  Barcode? result;
  QRViewController? controller;
  bool _pulse = false;
  bool isKeyboard = false;
  String lastCode = '';
  bool flashOn = false;
  bool isErrorInputTextSearch = false;
  late SpeechRecognition _speech;
  bool _speechRecognitionAvailable = false;
  bool _isListening = false;
  String transcription = '';
  Language selectedLang = languages.first;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  void initState() {
    super.initState();
    activateSpeechRecognizer();
  }

  void activateSpeechRecognizer() {
    _speech = SpeechRecognition();
    _speech.setAvailabilityHandler(onSpeechAvailability);
    _speech.setRecognitionStartedHandler(onRecognitionStarted);
    _speech.setRecognitionCompleteHandler(onRecognitionComplete);
    _speech.setErrorHandler(errorHandler);
    _speech.activate('pt_BR').then((res) {
      setState(() => _speechRecognitionAvailable = res);
    });
  }

  @override
  Widget build(BuildContext context) {

    final settingsQrcodeScannerController = Provider.of<SettingsQrCodeScannerController>(context);
    final detailsController = Provider.of<DetailsController>(context);
    final qrcodeScannerComponentController = Provider.of<QrCodeScannerComponentController>(context);

    var height = MediaQuery.of(context).size.height;
    Future.delayed(Duration(milliseconds: 700), () {
      if(mounted) {
        setState(() {
          _pulse = !_pulse;
        });
      }
    });

    return SafeArea(
      child: LayoutBuilder(builder: (_, constraints){
        return Scaffold(
          body: qrcodeScannerComponentController.isLoading ? LoadingComponent() : Stack(
            children: <Widget>[
              QRView(
                key: qrKey,
                onQRViewCreated: (value){
                  _onQRViewCreated(value, settingsQrcodeScannerController, detailsController, qrcodeScannerComponentController);
                },
              ),
              Visibility(
                visible: settingsQrcodeScannerController.gridlines ? settingsQrcodeScannerController.gridlines : false,
                child: Container(
                  height: height * 0.9,
                  child: Stack(
                    children: [
                      Visibility(
                        visible: true,
                        child: AnimatedOpacity(
                          opacity: _pulse ? 1.0 : 0.0,
                          duration: Duration(milliseconds: 700),
                          child: CustomPaint(
                            size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height * 2),
                            painter: CrosshairCamera(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Icon(Icons.arrow_back, color: Color(0xFFFFFFFF)),
                      onTap: (){
                        Navigator.pop(context);
                      }
                    ),
                    Container(
                      width: 100,
                      height: 25,
                      child: Center(child: Text("${qrcodeScannerComponentController.listVolumesQrCodeScanner.length} Volumes", style: AppTheme.textStyles.subTitleWhite)),
                      decoration: BoxDecoration(
                        color: AppTheme.colors.primary,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      )
                    ),
                    GestureDetector(
                      child: Icon(flashOn ? Icons.flash_on : Icons.flash_off, color: Color(0xFFFFFFFF)),
                      onTap: (){
                        controller!.toggleFlash();
                        flashOn = !flashOn;
                        setState(() {});
                      }
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.25),
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
              GestureDetector(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: isKeyboard ? MediaQuery.of(context).size.height * 0.45 : MediaQuery.of(context).size.height * 0.60,
                    right: MediaQuery.of(context).size.width * 0.75,
                  ),
                  child: Center(
                    child: Text("LIMPAR", style: AppTheme.textStyles.subTitleWhite),
                  )
                ),
                onTap: (){
                  qrcodeScannerComponentController.listVolumesQrCodeScanner = [];
                }
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: isKeyboard ? 160 : 60,
                  child: Column(
                    children: [
                      Visibility(
                        visible: isKeyboard,
                        child: TranslationAnimatedWidget(
                          enabled: isKeyboard,
                          curve: Curves.easeIn,
                          duration: Duration(seconds: 1),
                          values: [
                            Offset(0, 200),
                            Offset(0, -50),
                            Offset(0, 0),
                          ],
                          child: Column(
                            children: [
                              SizedBox(height: 15),
                              Center(
                                child: Text("Se necessário for, digite ou fale o código:", style: AppTheme.textStyles.subTitleGrey),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height: 55,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          controller: textFormSearchQrCodeScanner,
                                          decoration: InputDecoration(
                                            hintText: (!isErrorInputTextSearch) ? 'Digite aqui' : null,
                                            border: InputBorder.none,
                                            hintStyle: AppTheme.textStyles.subTitleGrey,
                                            errorText: (isErrorInputTextSearch) ? "Digite um valor válido..." : null,
                                          ),
                                          onChanged: (value) {
                                            if(value.length < 1){
                                              isErrorInputTextSearch = true;
                                            }else{
                                              isErrorInputTextSearch = false;
                                            }
                                            setState(() {});
                                          },
                                          onSubmitted: (value){
                                            if(textFormSearchQrCodeScanner.text == ""){
                                              isErrorInputTextSearch = true;
                                              setState(() {});
                                              return;
                                            }
                                            qrcodeScannerComponentController.changeListQrCodeScannerVolumes(value);
                                            qrcodeScannerComponentController.changeResultSearchQrCodeScanner(true, context);
                                            textFormSearchQrCodeScanner.text = "";
                                          },
                                        ),
                                      ),
                                      GestureDetector(
                                        child: Icon(Icons.mic, color: _isListening ? Color(0xFF00ABB8) : Colors.black),
                                        onTap: _speechRecognitionAvailable && !_isListening
                                          ? () => start()
                                          : () => stop(),
                                      ),
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0.r),
                                  border: Border.fromBorderSide(BorderSide(color: AppTheme.colors.border, width: 2.w)),
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Row(
                          children: [
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.29),
                              child: GestureDetector(
                                child: Icon(Icons.keyboard, color: isKeyboard ? Color(0xFF002C77) : AppTheme.colors.icon, size: 30),
                                onTap: (){
                                  setState(() {
                                    isKeyboard = !isKeyboard;
                                  });
                                },
                              )
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.1),
                              child: GestureDetector(
                                child: Icon(Icons.settings, color: AppTheme.colors.icon, size: 30),
                                onTap: (){
                                  Navigator.pushNamed(context, '/settingsqrcodescanner');
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15)
                    )
                  ),
                ),
              )
            ],
          ),
        );
      })
    );
  }

  void start() => _speech.activate(selectedLang.code).then((_) {
    return _speech.listen().then((result) {
      setState(() {
        _isListening = result;
      });
    });
  });

  void cancel() => _speech.cancel().then((_) => setState(() => _isListening = false));

  void stop() => _speech.stop().then((_) {
    setState(() => _isListening = false);
  });

  void onSpeechAvailability(bool result) => setState(() => _speechRecognitionAvailable = result);

  void onRecognitionStarted() {
    setState(() => _isListening = true);
  }

  void onRecognitionComplete(String text) async {
    textFormSearchQrCodeScanner.text = text;
    _speech.stop();
    setState(() => _isListening = false);
  }

  void errorHandler() => activateSpeechRecognizer();


  void _onQRViewCreated(QRViewController controller, SettingsQrCodeScannerController settingsQrcodeScannerController, DetailsController detailsController, QrCodeScannerComponentController qrcodeScannerComponentController) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      setState(() {
        if(!settingsQrcodeScannerController.duplicateCode){
          if(lastCode != scanData.code){
            qrcodeScannerComponentController.changeListQrCodeScannerVolumes(scanData.code!);
            qrcodeScannerComponentController.changeResultSearchQrCodeScanner(true, context);
          }
        }else{
          qrcodeScannerComponentController.changeResultSearchQrCodeScanner(true, context);
        }
        if(settingsQrcodeScannerController.soundReading ) FlutterBeep.beep();
        if(settingsQrcodeScannerController.vibration) Vibrate.vibrate();
        lastCode = scanData.code!;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

class CrosshairCamera extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 255, 000, 000)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.5000000);
    path_0.lineTo(size.width, size.height * 0.5000000);
    path_0.moveTo(size.width * 0.5000000, 0);
    path_0.lineTo(size.width * 0.5000000, size.height);

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}