import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:qeapp_trip/features/settings_qrcode_scanner/models/settings_qrcode_scanner_model.dart';

import '/infra/cache/local_storage_imp.dart';

part 'settings_qrcode_scanner_controller.g.dart';

class SettingsQrCodeScannerController = _SettingsQrCodeScannerControllerBase with _$SettingsQrCodeScannerController;

abstract class _SettingsQrCodeScannerControllerBase with Store {

  _SettingsQrCodeScannerControllerBase(){
    getSettingsQrCodeScanner();
  }

  final localStorage = LocalStorageImp();

  @observable
  bool vibration = false;
  
  @observable
  bool soundReading = false;
  
  @observable
  bool gridlines = false;
  
  @observable
  bool beep = false;
  
  @observable
  bool duplicateCode = false;

  @observable
  Map<String, dynamic> _dataSettingsQrcodeScanner = {};

  @observable
  bool isLoading = false;

  @observable
  SettingsQrCodeScannerModel settingsModel = SettingsQrCodeScannerModel();

  @action
  Future<Map<String, dynamic>> getSettingsQrCodeScanner() async {
    Map<String, dynamic> dataSettings = {};
    localStorage.getItem('settingsQrcodeScanner', 'settings').then((value){
      if(value != null) dataSettings = jsonDecode(value);
      _dataSettingsQrcodeScanner = dataSettings;
      if(dataSettings['vibration'] != null) vibration = dataSettings['vibration'];
      if(dataSettings['soundReading'] != null) soundReading = dataSettings['soundReading'];
      if(dataSettings['gridlines'] != null ) gridlines = dataSettings['gridlines'];
      if(dataSettings['beep'] != null) beep = dataSettings['beep'];
      if(dataSettings['duplicateCode'] != null) duplicateCode = dataSettings['duplicateCode'];
      settingsModel = SettingsQrCodeScannerModel.fromJson(dataSettings);
    });
    return dataSettings;
  }

  @action
  Future<bool> setSettingsQrCodeScanner() async {
    isLoading = true;
    try {
      Map<String, dynamic> dataSettings = settingsModel.toMap();
      await localStorage.setItem('settingsQrcodeScanner', 'settings', '');
      await localStorage.setItem('settingsQrcodeScanner', 'settings', jsonEncode(dataSettings));
      await Future.delayed(Duration(seconds: 1));
      isLoading = false;
      getSettingsQrCodeScanner();
      return true;
    } catch (e) {
      isLoading = false;
      return false;
    }
  }
  
}