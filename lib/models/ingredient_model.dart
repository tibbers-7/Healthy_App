import 'package:sample_app/models/nutrition_model.dart';

class IngredientModel{
  String name;
  NutritionModel nutritionValue;
  String iconPath;

  IngredientModel({
    required this.name,
    required this.nutritionValue,
    required this.iconPath
  });

  static List<IngredientModel> getIngredients(){
    List<IngredientModel> ingredients=[];
    return ingredients;
  }
}