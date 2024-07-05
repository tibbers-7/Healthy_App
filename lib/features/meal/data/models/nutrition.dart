import 'package:healthy_app/features/meal/domain/entities/nutrition.dart';

class NutritionModel extends NutritionEntity {
  NutritionModel({
    required super.calories,
    required super.fats,
    required super.proteins,
    required super.carbs,
    required super.vitamins,
    required super.fibre,
    required super.minerals,
  });

  factory NutritionModel.fromJson(Map<String, dynamic> json) {
    return NutritionModel(
      calories: json['calories']?.toDouble() ?? 0,
      fats: json['fats']?.toDouble() ?? 0,
      proteins: json['proteins']?.toDouble() ?? 0,
      carbs: json['carbs']?.toDouble() ?? 0,
      vitamins: json['vitamins']?.toDouble() ?? 0,
      fibre: json['fibre']?.toDouble() ?? 0,
      minerals: json['minerals']?.toDouble() ?? 0,
    );
  }

}