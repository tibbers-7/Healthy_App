import 'package:sample_app/models/ingredient_model.dart';
import 'package:sample_app/models/measure_model.dart';
import 'package:sample_app/models/nutrition_model.dart';

class IngredientValueModel{
  IngredientModel ingredient;
  MeasureModel measure;
  late NutritionModel nutritionValue;

  IngredientValueModel({
    required this.ingredient,
    required this.measure,
  })
  {
    nutritionValue=NutritionModel.getTotalIngredientNutrition(ingredient.nutritionValue,measure.value);
  }
}