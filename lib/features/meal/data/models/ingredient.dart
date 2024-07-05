import 'package:healthy_app/features/meal/data/models/nutrition.dart';
import 'package:healthy_app/features/meal/domain/entities/ingredient.dart';

class IngredientModel extends IngredientEntity{
  const IngredientModel({required super.id, required super.name, required super.nutritionValue, required super.iconPath});

  factory IngredientModel.fromJson(Map<String,dynamic> map){
    return IngredientModel(
      id: map["id"] ?? "", 
      name: map["name"] ?? "", 
      nutritionValue: NutritionModel.fromJson(map["nutritionValue"] ?? {}), 
      iconPath: map["iconPath"] ?? "");
  }

}