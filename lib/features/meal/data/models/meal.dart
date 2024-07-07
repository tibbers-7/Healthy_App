import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:healthy_app/features/meal/data/models/ingredient_value.dart';
import 'package:healthy_app/features/meal/domain/entities/meal.dart';

import '../../domain/entities/ingredient_value.dart';

@Entity(tableName: 'meal',primaryKeys: ['id'])
class MealModel extends MealEntity {
  
  @ColumnInfo(name: 'ingredients')
  final String? ingredientsJson;

  @ColumnInfo(name:'steps')
  final String? stepsJson;

  @ColumnInfo(name: 'type')
  final String typeString;

  MealModel(
    {required super.id, 
    required super.name, 
    required super.iconPath, 
    required super.author, 
    required super.description, 
    required this.ingredientsJson, 
    required this.stepsJson,
    required this.typeString
    }) : super(
          type: MealType.values.byName(typeString),
        ) 
    {
      final ingredientsList = jsonDecode(ingredientsJson!) as List<dynamic>;
      steps = jsonDecode(stepsJson!) as List<String>;

      ingredients = ingredientsList.map((ingredientMap) => IngredientValueModel.fromJson(ingredientMap)).toList();
      
  }


  factory MealModel.fromJson(Map<String,dynamic> map){

    return MealModel(
      id: map["id"] ?? 0, 
      name: map["name"] ?? "", 
      iconPath: map["iconPath"] ?? "", 
      author: map["author"] ?? "", 
      description: map["description"] ?? "", 
      typeString:map['typeString'],
      ingredientsJson: map['ingredientsJson'] ?? '',
      stepsJson:map['steps'],
      );
  }

  factory MealModel.fromEntity(MealEntity entity){
    return MealModel(
      id: entity.id, 
      name: entity.name, 
      iconPath: entity.iconPath, 
      author: entity.author, 
      description: entity.description, 
      ingredientsJson: jsonEncode(entity.ingredients!.map((ingredient) => IngredientValueModel.fromEntity(ingredient).toJson()).toList()), 
      stepsJson: jsonEncode(entity.steps), 
      typeString: entity.type!.name);
  }
}