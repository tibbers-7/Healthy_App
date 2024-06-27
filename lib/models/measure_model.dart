enum MeasureType { g, kg, l, dl, ml, kCal, tsp, tbsp, items}

class MeasureModel{
  MeasureType measureType;
  double value;

  MeasureModel({
    required this.measureType,
    required this.value
  });

  
}