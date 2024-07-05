import 'package:healthy_app/features/meal/data/models/ingredient_value.dart';
import 'package:healthy_app/features/meal/domain/entities/meal.dart';

class MealModel extends MealEntity {
  MealModel({required super.id, required super.name, required super.iconPath, required super.author, required super.description, required super.type, required super.ingredients, required super.steps});

  factory MealModel.fromJson(Map<String,dynamic> map){
    final typesList = map['type'] as List<String>;
    final ingredientsList = map['ingredients'] as List<dynamic>;
    final stepsList = map['steps'] as List<String>;

    return MealModel(
      id: map["id"] ?? 0, 
      name: map["name"] ?? "", 
      iconPath: map["iconPath"] ?? "", 
      author: map["author"] ?? "", 
      description: map["description"] ?? "", 
      type: typesList.map((type) => MealType.values.firstWhere((element) => element.toString() == type)).toList(),
      ingredients: ingredientsList.map((ingredientMap) => IngredientValueModel.fromJson(ingredientMap)).toList(),
      steps:stepsList,
      );
  }
}