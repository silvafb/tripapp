// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailsController on _DetailsControllerBase, Store {
  final _$vehicleDetailsAtom =
      Atom(name: '_DetailsControllerBase.vehicleDetails');

  @override
  String get vehicleDetails {
    _$vehicleDetailsAtom.reportRead();
    return super.vehicleDetails;
  }

  @override
  set vehicleDetails(String value) {
    _$vehicleDetailsAtom.reportWrite(value, super.vehicleDetails, () {
      super.vehicleDetails = value;
    });
  }

  final _$vehicleCapacityAtom =
      Atom(name: '_DetailsControllerBase.vehicleCapacity');

  @override
  String get vehicleCapacity {
    _$vehicleCapacityAtom.reportRead();
    return super.vehicleCapacity;
  }

  @override
  set vehicleCapacity(String value) {
    _$vehicleCapacityAtom.reportWrite(value, super.vehicleCapacity, () {
      super.vehicleCapacity = value;
    });
  }

  final _$vehicleValueAtom = Atom(name: '_DetailsControllerBase.vehicleValue');

  @override
  String get vehicleValue {
    _$vehicleValueAtom.reportRead();
    return super.vehicleValue;
  }

  @override
  set vehicleValue(String value) {
    _$vehicleValueAtom.reportWrite(value, super.vehicleValue, () {
      super.vehicleValue = value;
    });
  }

  final _$vehicleCarrierAtom =
      Atom(name: '_DetailsControllerBase.vehicleCarrier');

  @override
  String get vehicleCarrier {
    _$vehicleCarrierAtom.reportRead();
    return super.vehicleCarrier;
  }

  @override
  set vehicleCarrier(String value) {
    _$vehicleCarrierAtom.reportWrite(value, super.vehicleCarrier, () {
      super.vehicleCarrier = value;
    });
  }

  final _$listVolumesAtom = Atom(name: '_DetailsControllerBase.listVolumes');

  @override
  List<String> get listVolumes {
    _$listVolumesAtom.reportRead();
    return super.listVolumes;
  }

  @override
  set listVolumes(List<String> value) {
    _$listVolumesAtom.reportWrite(value, super.listVolumes, () {
      super.listVolumes = value;
    });
  }

  final _$indexTabBarDetailsPageAtom =
      Atom(name: '_DetailsControllerBase.indexTabBarDetailsPage');

  @override
  int get indexTabBarDetailsPage {
    _$indexTabBarDetailsPageAtom.reportRead();
    return super.indexTabBarDetailsPage;
  }

  @override
  set indexTabBarDetailsPage(int value) {
    _$indexTabBarDetailsPageAtom
        .reportWrite(value, super.indexTabBarDetailsPage, () {
      super.indexTabBarDetailsPage = value;
    });
  }

  final _$_DetailsControllerBaseActionController =
      ActionController(name: '_DetailsControllerBase');

  @override
  dynamic changeIndexTabBarDetailsPage(int value) {
    final _$actionInfo = _$_DetailsControllerBaseActionController.startAction(
        name: '_DetailsControllerBase.changeIndexTabBarDetailsPage');
    try {
      return super.changeIndexTabBarDetailsPage(value);
    } finally {
      _$_DetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onChangeListVolumesDetails(String value) {
    final _$actionInfo = _$_DetailsControllerBaseActionController.startAction(
        name: '_DetailsControllerBase.onChangeListVolumesDetails');
    try {
      return super.onChangeListVolumesDetails(value);
    } finally {
      _$_DetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onChangeVehicle({required String vehicle, required String capacity}) {
    final _$actionInfo = _$_DetailsControllerBaseActionController.startAction(
        name: '_DetailsControllerBase.onChangeVehicle');
    try {
      return super.onChangeVehicle(vehicle: vehicle, capacity: capacity);
    } finally {
      _$_DetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onChangeCarrier(String value) {
    final _$actionInfo = _$_DetailsControllerBaseActionController.startAction(
        name: '_DetailsControllerBase.onChangeCarrier');
    try {
      return super.onChangeCarrier(value);
    } finally {
      _$_DetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
vehicleDetails: ${vehicleDetails},
vehicleCapacity: ${vehicleCapacity},
vehicleValue: ${vehicleValue},
vehicleCarrier: ${vehicleCarrier},
listVolumes: ${listVolumes},
indexTabBarDetailsPage: ${indexTabBarDetailsPage}
    ''';
  }
}
