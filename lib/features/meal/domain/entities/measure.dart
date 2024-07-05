
enum MeasureType { 
  g, kg, l, dl, ml, kCal, tsp, tbsp, items;
  String toJson() => name;
  static MeasureType fromJson(String json) => values.byName(json);
}

class MeasureEntity {
  MeasureType ? measureType;
  double ? value;

  MeasureEntity({
    required this.measureType,
    required this.value
  });
  
  
}