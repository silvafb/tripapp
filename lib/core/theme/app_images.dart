abstract class AppImages {
  String get appVehicle;
  String get appMotocycle;
  String get appTruck;
  String get appVehicles;
  String get appBackgroundImageCodeScanner;
  String get appBoxBeep;
}

class AppImagesImpl implements AppImages {

  @override
  String get appVehicle => "assets/images/vehicle.png";

  @override
  String get appMotocycle => "assets/images/motocycle.png";

  @override
  String get appTruck => "assets/images/truck.png";

  @override
  String get appVehicles => "assets/images/vehicles.png";

  @override
  String get appBackgroundImageCodeScanner => "assets/images/background_image_code_scanner.png";

  @override
  String get appBoxBeep => "assets/images/bipagem_caixa.png";
}
