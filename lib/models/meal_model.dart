import 'package:sample_app/models/ingredientValue_model.dart';
import 'package:sample_app/models/nutrition_model.dart';

enum MealType { breakfast, brunch, lunch, dinner, snack, drink }

class MealModel{
  int id;
  String name;
  String iconPath;
  String author;
  String description;
  List<MealType> type;
  List<IngredientValueModel> ingredients;
  late NutritionModel nutritionValue;
  List<String> steps;


  MealModel(
    {
      required this.id,
      required this.name,
      required this.iconPath,
      required this.author,
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

  static MealModel getBlueberryPancake(){
    MealModel meal=MealModel(id:1,name: 'Blueberry Pancake', iconPath: 'assets/icons/blueberry-pancake.svg',author:'James Ruth', description: 'Pancakes are some people\'s favorite breakfast, who doesn\'t like pancakes? Especially with the real honey splash on top of the pancakes, of course everyone loves that! Besides being absolutely delicious, they\'re a great source of proteins! Easy and quick to make, this is a household must, especially if you have children!', type: [MealType.breakfast], ingredients: IngredientValueModel.getBlueberryIngredients(), steps: ['Prepare all of the ingredients that are needed','Mix flour, sugar, salt, and baking powder','In a seperate place, mix the eggs and liquid milk until blended','Put the egg and milk mixture into the dry ingredients, stir until smooth and smooth','Prepare all of the ingredients that are needed']);
    return meal;
  }

}