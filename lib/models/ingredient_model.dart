import 'package:sample_app/models/nutrition_model.dart';

class IngredientModel{
  int id;
  String name;
  NutritionModel nutritionValue;
  String iconPath;

  IngredientModel({
    required this.id,
    required this.name,
    required this.nutritionValue,
    required this.iconPath
  });

  static List<IngredientModel> getIngredients(){
    List<IngredientModel> ingredients=[];

    ingredients.add(IngredientModel(id:1,name: 'Wheat Flour', iconPath: 'assets/icons/Flour.svg',nutritionValue: NutritionModel(calories: 3.40,proteins: 0.132,carbs: 0.72,fibre: 0.107,fats: 0.025, vitamins: 0, minerals: 0), ));
    ingredients.add(IngredientModel(id:2,name: 'Sugar', iconPath: 'assets/icons/Sugar.svg',nutritionValue: NutritionModel(calories: 3.85,proteins: 0,carbs: 1,fibre: 0,fats: 0, vitamins: 0, minerals: 0), ));
    ingredients.add(IngredientModel(id:3,name: 'Baking Soda', iconPath: 'assets/icons/BakingSoda.svg',nutritionValue: NutritionModel(calories: 0,proteins: 0,carbs: 0,fibre: 0,fats: 0, vitamins: 0, minerals: 0.274), ));
    ingredients.add(IngredientModel(id:4,name: 'Egg', iconPath: 'assets/icons/Eggs.svg',nutritionValue: NutritionModel(calories: 78,proteins: 6,carbs: 0.6,fibre: 0,fats: 5, vitamins: 1.127, minerals: 0.243), ));
    return ingredients;
  }
}