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

  static List<IngredientValueModel> getBlueberryIngredients(){
    List<IngredientModel> allIngredients=IngredientModel.getIngredients();
    List<IngredientValueModel> bpIngredients=[];
    bpIngredients.add(IngredientValueModel(ingredient: allIngredients[0], measure: MeasureModel(measureType: MeasureType.g, value: 100)));
    bpIngredients.add(IngredientValueModel(ingredient: allIngredients[1], measure: MeasureModel(measureType: MeasureType.tbsp, value: 3)));
    bpIngredients.add(IngredientValueModel(ingredient: allIngredients[2], measure: MeasureModel(measureType: MeasureType.tsp, value: 2)));
    bpIngredients.add(IngredientValueModel(ingredient: allIngredients[3], measure: MeasureModel(measureType: MeasureType.items, value: 2)));
    return bpIngredients;
  }
}