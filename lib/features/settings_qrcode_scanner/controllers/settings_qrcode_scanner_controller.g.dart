// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_qrcode_scanner_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsQrCodeScannerController
    on _SettingsQrCodeScannerControllerBase, Store {
  final _$vibrationAtom =
      Atom(name: '_SettingsQrCodeScannerControllerBase.vibration');

  @override
  bool get vibration {
    _$vibrationAtom.reportRead();
    return super.vibration;
  }

  @override
  set vibration(bool value) {
    _$vibrationAtom.reportWrite(value, super.vibration, () {
      super.vibration = value;
    });
  }

  final _$soundReadingAtom =
      Atom(name: '_SettingsQrCodeScannerControllerBase.soundReading');

  @override
  bool get soundReading {
    _$soundReadingAtom.reportRead();
    return super.soundReading;
  }

  @override
  set soundReading(bool value) {
    _$soundReadingAtom.reportWrite(value, super.soundReading, () {
      super.soundReading = value;
    });
  }

  final _$gridlinesAtom =
      Atom(name: '_SettingsQrCodeScannerControllerBase.gridlines');

  @override
  bool get gridlines {
    _$gridlinesAtom.reportRead();
    return super.gridlines;
  }

  @override
  set gridlines(bool value) {
    _$gridlinesAtom.reportWrite(value, super.gridlines, () {
      super.gridlines = value;
    });
  }

  final _$beepAtom = Atom(name: '_SettingsQrCodeScannerControllerBase.beep');

  @override
  bool get beep {
    _$beepAtom.reportRead();
    return super.beep;
  }

  @override
  set beep(bool value) {
    _$beepAtom.reportWrite(value, super.beep, () {
      super.beep = value;
    });
  }

  final _$duplicateCodeAtom =
      Atom(name: '_SettingsQrCodeScannerControllerBase.duplicateCode');

  @override
  bool get duplicateCode {
    _$duplicateCodeAtom.reportRead();
    return super.duplicateCode;
  }

  @override
  set duplicateCode(bool value) {
    _$duplicateCodeAtom.reportWrite(value, super.duplicateCode, () {
      super.duplicateCode = value;
    });
  }

  final _$_dataSettingsQrcodeScannerAtom = Atom(
      name: '_SettingsQrCodeScannerControllerBase._dataSettingsQrcodeScanner');

  @override
  Map<String, dynamic> get _dataSettingsQrcodeScanner {
    _$_dataSettingsQrcodeScannerAtom.reportRead();
    return super._dataSettingsQrcodeScanner;
  }

  @override
  set _dataSettingsQrcodeScanner(Map<String, dynamic> value) {
    _$_dataSettingsQrcodeScannerAtom
        .reportWrite(value, super._dataSettingsQrcodeScanner, () {
      super._dataSettingsQrcodeScanner = value;
    });
  }

  final _$isLoadingAtom =
      Atom(name: '_SettingsQrCodeScannerControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$settingsModelAtom =
      Atom(name: '_SettingsQrCodeScannerControllerBase.settingsModel');

  @override
  SettingsQrCodeScannerModel get settingsModel {
    _$settingsModelAtom.reportRead();
    return super.settingsModel;
  }

  @override
  set settingsModel(SettingsQrCodeScannerModel value) {
    _$settingsModelAtom.reportWrite(value, super.settingsModel, () {
      super.settingsModel = value;
    });
  }

  final _$getSettingsQrCodeScannerAsyncAction = AsyncAction(
      '_SettingsQrCodeScannerControllerBase.getSettingsQrCodeScanner');

  @override
  Future<Map<String, dynamic>> getSettingsQrCodeScanner() {
    return _$getSettingsQrCodeScannerAsyncAction
        .run(() => super.getSettingsQrCodeScanner());
  }

  final _$setSettingsQrCodeScannerAsyncAction = AsyncAction(
      '_SettingsQrCodeScannerControllerBase.setSettingsQrCodeScanner');

  @override
  Future<bool> setSettingsQrCodeScanner() {
    return _$setSettingsQrCodeScannerAsyncAction
        .run(() => super.setSettingsQrCodeScanner());
  }

  @override
  String toString() {
    return '''
vibration: ${vibration},
soundReading: ${soundReading},
gridlines: ${gridlines},
beep: ${beep},
duplicateCode: ${duplicateCode},
isLoading: ${isLoading},
settingsModel: ${settingsModel}
    ''';
  }
}
