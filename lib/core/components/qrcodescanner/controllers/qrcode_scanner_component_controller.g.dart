// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qrcode_scanner_component_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QrCodeScannerComponentController
    on _QrCodeScannerComponentControllerBase, Store {
  final _$isLoadingAtom =
      Atom(name: '_QrCodeScannerComponentControllerBase.isLoading');

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

  final _$isResultSearchQrCodeScannerAtom = Atom(
      name:
          '_QrCodeScannerComponentControllerBase.isResultSearchQrCodeScanner');

  @override
  bool get isResultSearchQrCodeScanner {
    _$isResultSearchQrCodeScannerAtom.reportRead();
    return super.isResultSearchQrCodeScanner;
  }

  @override
  set isResultSearchQrCodeScanner(bool value) {
    _$isResultSearchQrCodeScannerAtom
        .reportWrite(value, super.isResultSearchQrCodeScanner, () {
      super.isResultSearchQrCodeScanner = value;
    });
  }

  final _$listVolumesQrCodeScannerAtom = Atom(
      name: '_QrCodeScannerComponentControllerBase.listVolumesQrCodeScanner');

  @override
  List<String> get listVolumesQrCodeScanner {
    _$listVolumesQrCodeScannerAtom.reportRead();
    return super.listVolumesQrCodeScanner;
  }

  @override
  set listVolumesQrCodeScanner(List<String> value) {
    _$listVolumesQrCodeScannerAtom
        .reportWrite(value, super.listVolumesQrCodeScanner, () {
      super.listVolumesQrCodeScanner = value;
    });
  }

  final _$titleAppBarResultSearchQrCodeScannerComponentAtom = Atom(
      name:
          '_QrCodeScannerComponentControllerBase.titleAppBarResultSearchQrCodeScannerComponent');

  @override
  String get titleAppBarResultSearchQrCodeScannerComponent {
    _$titleAppBarResultSearchQrCodeScannerComponentAtom.reportRead();
    return super.titleAppBarResultSearchQrCodeScannerComponent;
  }

  @override
  set titleAppBarResultSearchQrCodeScannerComponent(String value) {
    _$titleAppBarResultSearchQrCodeScannerComponentAtom.reportWrite(
        value, super.titleAppBarResultSearchQrCodeScannerComponent, () {
      super.titleAppBarResultSearchQrCodeScannerComponent = value;
    });
  }

  final _$titleButtonResultSearchQrCodeScannerComponentAtom = Atom(
      name:
          '_QrCodeScannerComponentControllerBase.titleButtonResultSearchQrCodeScannerComponent');

  @override
  String get titleButtonResultSearchQrCodeScannerComponent {
    _$titleButtonResultSearchQrCodeScannerComponentAtom.reportRead();
    return super.titleButtonResultSearchQrCodeScannerComponent;
  }

  @override
  set titleButtonResultSearchQrCodeScannerComponent(String value) {
    _$titleButtonResultSearchQrCodeScannerComponentAtom.reportWrite(
        value, super.titleButtonResultSearchQrCodeScannerComponent, () {
      super.titleButtonResultSearchQrCodeScannerComponent = value;
    });
  }

  final _$colorAppBarResultSearchQrCodeScannerComponentAtom = Atom(
      name:
          '_QrCodeScannerComponentControllerBase.colorAppBarResultSearchQrCodeScannerComponent');

  @override
  Color get colorAppBarResultSearchQrCodeScannerComponent {
    _$colorAppBarResultSearchQrCodeScannerComponentAtom.reportRead();
    return super.colorAppBarResultSearchQrCodeScannerComponent;
  }

  @override
  set colorAppBarResultSearchQrCodeScannerComponent(Color value) {
    _$colorAppBarResultSearchQrCodeScannerComponentAtom.reportWrite(
        value, super.colorAppBarResultSearchQrCodeScannerComponent, () {
      super.colorAppBarResultSearchQrCodeScannerComponent = value;
    });
  }

  final _$isLocatedAtom =
      Atom(name: '_QrCodeScannerComponentControllerBase.isLocated');

  @override
  bool get isLocated {
    _$isLocatedAtom.reportRead();
    return super.isLocated;
  }

  @override
  set isLocated(bool value) {
    _$isLocatedAtom.reportWrite(value, super.isLocated, () {
      super.isLocated = value;
    });
  }

  final _$changeResultSearchQrCodeScannerAsyncAction = AsyncAction(
      '_QrCodeScannerComponentControllerBase.changeResultSearchQrCodeScanner');

  @override
  Future changeResultSearchQrCodeScanner(bool value, BuildContext context) {
    return _$changeResultSearchQrCodeScannerAsyncAction
        .run(() => super.changeResultSearchQrCodeScanner(value, context));
  }

  final _$searchOrderAsyncAction =
      AsyncAction('_QrCodeScannerComponentControllerBase.searchOrder');

  @override
  Future<Map<String, dynamic>> searchOrder({required String order}) {
    return _$searchOrderAsyncAction.run(() => super.searchOrder(order: order));
  }

  final _$_QrCodeScannerComponentControllerBaseActionController =
      ActionController(name: '_QrCodeScannerComponentControllerBase');

  @override
  dynamic changeListQrCodeScannerVolumes(String value) {
    final _$actionInfo =
        _$_QrCodeScannerComponentControllerBaseActionController.startAction(
            name:
                '_QrCodeScannerComponentControllerBase.changeListQrCodeScannerVolumes');
    try {
      return super.changeListQrCodeScannerVolumes(value);
    } finally {
      _$_QrCodeScannerComponentControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isResultSearchQrCodeScanner: ${isResultSearchQrCodeScanner},
listVolumesQrCodeScanner: ${listVolumesQrCodeScanner},
titleAppBarResultSearchQrCodeScannerComponent: ${titleAppBarResultSearchQrCodeScannerComponent},
titleButtonResultSearchQrCodeScannerComponent: ${titleButtonResultSearchQrCodeScannerComponent},
colorAppBarResultSearchQrCodeScannerComponent: ${colorAppBarResultSearchQrCodeScannerComponent},
isLocated: ${isLocated}
    ''';
  }
}
