class IotModel {
  // Field
  int suitableTem,
      water,
      suitableHumi,
      light,
      fog,
      //  tempHigh,
      suitable_Humi_High,
      fan,
      mode,
      // humidityLow,
      //tempLow;
      fanOff_Duration,
      fanOn_Duration,
      fogOff_Duration,
      fogOn_Duration,
      humi_Out,
      waterFloorDuration;

  //Constructor
  IotModel(
    this.suitableTem,
    this.water,
    this.suitableHumi,
    this.light,
    this.fog,
    this.fan,
    this.suitable_Humi_High,
    this.fanOff_Duration,
    this.fanOn_Duration,
    this.fogOff_Duration,
    this.fogOn_Duration,
    this.humi_Out,
    this.waterFloorDuration,
    // this.humidityLow,
    this.mode,
    //this.tempHigh,
    //this.tempLow
  );

  IotModel.formMap(Map<dynamic, dynamic> map) {
    suitableTem = map['Suitable_Tem'];
    water = map['Water_Floor'];
    suitableHumi = map['Suitable_Humi'];
    light = map['Light'];
    fog = map['Fog'];
    fan = map['Fan'];
    suitable_Humi_High = map['Suitable_Humi_High'];
    //humidityLow = map['Humidity_Low'];
    mode = map['Mode'];
    fanOff_Duration = map['FanOff_Duration'];
    fanOn_Duration = map['FanOn_Duration'];
    fogOff_Duration = map['FogOff_Duration'];
    fogOn_Duration = map['FogOn_Duration'];
    humi_Out = map['Humi_Out'];
    waterFloorDuration = map['WaterFloorDuration'];
    // tempHigh = map['Temp_High'];
    //  tempLow = map['Temp_Low'];
  }
  Map<dynamic, dynamic> toMap() {
    final Map<dynamic, dynamic> map = Map<dynamic, dynamic>();
    map['Suitable_Tem'] = suitableTem;
    map['Water_Floor'] = water;
    map['Suitable_Humi'] = suitableHumi;
    map['Light'] = light;
    map['Fog'] = fog;
    map['Fan'] = fan;
    map['Suitable_Humi_High'] = suitable_Humi_High;
    map['WaterFloorDuration'] = waterFloorDuration;
    map['Humi_Out'] = humi_Out;
    map['FogOff_Duration'] = fogOff_Duration;
    map['FogOn_Duration'] = fogOn_Duration;
    map['FanOff_Duration'] = fanOff_Duration;
    map['FanOn_Duration'] = fanOn_Duration;
    //  map['Humidity_Low'] = humidityLow;
    map['Mode'] = mode;
    //map['Temp_High'] = tempHigh;
   // map['Temp_Low'] = tempLow;
    return map;
  }
}
