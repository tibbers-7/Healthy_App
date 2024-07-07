import 'package:healthy_app/features/meal/domain/entities/measure.dart';

class MeasureModel extends MeasureEntity{
  MeasureModel({required super.measureType, required super.value});

  factory MeasureModel.fromJson(Map<String, dynamic> json){
    return MeasureModel(
      measureType: MeasureType.fromJson(json['measureType']),
      value: json['value']?.toDouble() ?? 0,
    );
  }

  
  factory MeasureModel.fromEntity(MeasureEntity entity){
    return MeasureModel(measureType: entity.measureType, value: entity.value);
  }

  Map<String, dynamic> toJson() => {
        'measureType':measureType,
        'value':value
      };



}