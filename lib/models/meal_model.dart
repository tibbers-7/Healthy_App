import 'package:sample_app/models/ingredientValue_model.dart';
import 'package:sample_app/models/nutrition_model.dart';

enum MealType { breakfast, brunch, lunch, dinner, snack, drink }

class MealModel{
  String name;
  String iconPath;
  String description;
  List<MealType> type;
  List<IngredientValueModel> ingredients;
  late NutritionModel nutritionValue;
  List<String> steps;


  MealModel(
    {
      required this.name,
      required this.iconPath,
      required this.description,
      required this.type,
      required this.ingredients,
      required this.steps
    }
  )
  {
    nutritionValue=NutritionModel.empty();
    for (var ingredient in ingredients) {
      nutritionValue=nutritionValue+ingredient.nutritionValue;
    }
  }
}