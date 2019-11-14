class IotModel {
  // Field
  int suitableTem,
      water,
      suitableHumi,
      light,
      fog,
      tempHigh,
      humidityHigh,
      fan,
      mode,
      humidityLow,
      tempLow;

  //Constructor
  IotModel(
      this.suitableTem,
      this.water,
      this.suitableHumi,
      this.light,
      this.fog,
      this.fan,
      this.humidityHigh,
      this.humidityLow,
      this.mode,
      this.tempHigh,
      this.tempLow);

  IotModel.formMap(Map<dynamic, dynamic> map) {
    suitableTem = map['Suitable_Tem'];
    water = map['Water'];
    suitableHumi = map['Suitable_Humi'];
    light = map['Light'];
    fog = map['Fog'];
    fan = map['Fan'];
    humidityHigh = map['Humidity_High'];
    humidityLow = map['Humidity_Low'];
    mode = map['Mode'];
    tempHigh = map['Temp_High'];
    tempLow = map['Temp_Low'];
  }
  Map<dynamic, dynamic> toMap() {
    final Map<dynamic, dynamic> map = Map<dynamic, dynamic>();
    map['Suitable_Tem']=suitableTem;
    map['Water']=water;
    map['Suitable_Humi']=suitableHumi;
    map['Light']=light;
    map['Fog']=fog;
    map['Fan']=fan;
    map['Humidity_High']=humidityHigh;
    map['Humidity_Low']=humidityLow;
    map['Mode']=mode;
    map['Temp_High']=tempHigh;
    map['Temp_Low']=tempLow;
    return map;
  }
}
