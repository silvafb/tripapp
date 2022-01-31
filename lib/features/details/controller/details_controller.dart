import 'package:mobx/mobx.dart';
part 'details_controller.g.dart';

class DetailsController = _DetailsControllerBase with _$DetailsController;

abstract class _DetailsControllerBase with Store {

  @observable
  String vehicleDetails = "Selecione um veículo";

  @observable
  String vehicleCapacity = "----- m²";

  @observable
  String vehicleValue = "R\$ 000,00";

  @observable
  String vehicleCarrier = "";

  @observable
  List<String> listVolumes = [];

  @observable
  int indexTabBarDetailsPage = 0;

  @action
  changeIndexTabBarDetailsPage(int value) => indexTabBarDetailsPage = value;

  @action
  onChangeListVolumesDetails(String value){
    listVolumes.insert(0, value);
    listVolumes = listVolumes;
  }

  @action
  onChangeVehicle({required String vehicle, required String capacity}){
    vehicleDetails = vehicle;
    vehicleCapacity = capacity;
    if(vehicleDetails == "Moto"){
      vehicleValue = "R\$ 100,00";
    }else{
      vehicleValue = "R\$ 300,00";
    }
  }

  @action
  onChangeCarrier(String value) => vehicleCarrier = value;
  
}