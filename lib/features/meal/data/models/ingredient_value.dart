import 'package:healthy_app/features/meal/data/models/ingredient.dart';
import 'package:healthy_app/features/meal/data/models/measure.dart';
import 'package:healthy_app/features/meal/domain/entities/ingredient_value.dart';

class IngredientValueModel extends IngredientValueEntity{
  IngredientValueModel({required super.ingredient, required super.measure});

  factory IngredientValueModel.fromJson(Map<String,dynamic> map){
    return IngredientValueModel(
      ingredient: IngredientModel.fromJson(map["ingredient"] ?? {}), 
      measure: MeasureModel.fromJson(map["measure"] ?? {})
    );
  }

}