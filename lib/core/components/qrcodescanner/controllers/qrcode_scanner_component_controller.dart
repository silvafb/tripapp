import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '/data/repositories/search/search_repository.dart';

part 'qrcode_scanner_component_controller.g.dart';

class QrCodeScannerComponentController = _QrCodeScannerComponentControllerBase with _$QrCodeScannerComponentController;

abstract class _QrCodeScannerComponentControllerBase with Store {

  SearchRepositoryImp searchRepository;
  _QrCodeScannerComponentControllerBase(this.searchRepository);

  @observable
  bool isLoading = false;

  @observable
  bool isResultSearchQrCodeScanner = false;

  @observable
  List<String> listVolumesQrCodeScanner = [];

  String lastVolume = '';

  @observable
  String titleAppBarResultSearchQrCodeScannerComponent = '';

  @observable
  String titleButtonResultSearchQrCodeScannerComponent = '';

  @observable
  Color colorAppBarResultSearchQrCodeScannerComponent = Color(0xFFFFFFFF);

  @observable
  bool isLocated = false;

  @action
  changeResultSearchQrCodeScanner(bool value, BuildContext context) async {
    isResultSearchQrCodeScanner = value;
    if(isResultSearchQrCodeScanner){
      searchOrder(order: lastVolume).then((value){
        Navigator.pushNamed(context, '/result_search_qrcode_scanner');
        if(value['Pedidos'] == null){
          titleAppBarResultSearchQrCodeScannerComponent = 'Não localizado';
          colorAppBarResultSearchQrCodeScannerComponent = Color(0xFFFFB800);
          titleButtonResultSearchQrCodeScannerComponent = 'Ler novamente';
          isLocated = false;
          return;
        }
        titleAppBarResultSearchQrCodeScannerComponent = 'Localizado';
        colorAppBarResultSearchQrCodeScannerComponent = Color(0xFF7DD76F);
        titleButtonResultSearchQrCodeScannerComponent = 'Confirmar';
        isLocated = true;
      });
    }
  }

  @action
  changeListQrCodeScannerVolumes(String value){
    lastVolume = value;
    listVolumesQrCodeScanner.insert(0, value);
    listVolumesQrCodeScanner = listVolumesQrCodeScanner;
  }

  @action
  Future<Map<String, dynamic>> searchOrder({ required String order }) async {
    try {
      isLoading = true;
      final Map<String, dynamic> filters = {"Rastreio.EtiquetaRemetente":{"=":"$order"}};
      final result = await searchRepository.search(filters: filters);
      isLoading = false;
      return result; 
    } catch (e) {
      isLoading = false;
      throw Exception;
    }
  }
}