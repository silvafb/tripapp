class SettingsQrCodeScannerModel {
  bool? vibration;
  bool? soundReading;
  bool? gridlines;
  bool? beep;
  bool? duplicateCode;

  SettingsQrCodeScannerModel({
    this.vibration = false,
    this.soundReading = false,
    this.gridlines = false,
    this.beep = false,
    this.duplicateCode = false,
  });

  SettingsQrCodeScannerModel.fromJson(Map<String, dynamic> map) : 
    vibration = map['vibration'],
    soundReading = map['soundReading'],
    gridlines = map['gridlines'],
    beep = map['beep'],
    duplicateCode = map['duplicateCode']
  ;


  Map<String, dynamic> toMap() => {
    'vibration': vibration,
    'soundReading': soundReading,
    'gridlines': gridlines,
    'beep': beep,
    'duplicateCode': duplicateCode,
  };

}