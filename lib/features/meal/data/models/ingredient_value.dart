import 'package:healthy_app/features/meal/data/models/ingredient.dart';
import 'package:healthy_app/features/meal/data/models/measure.dart';
import 'package:healthy_app/features/meal/domain/entities/ingredient_value.dart';

class IngredientValueModel extends IngredientValueEntity{
  IngredientValueModel({required super.ingredientId, required super.measure});

  factory IngredientValueModel.fromJson(Map<String,dynamic> map){
    return IngredientValueModel(
      ingredientId: map["ingredientId"] ?? 0, 
      measure: MeasureModel.fromJson(map["measure"] ?? {})
    );
  }

  factory IngredientValueModel.fromEntity(IngredientValueEntity entity){
    return IngredientValueModel(
      ingredientId: entity.ingredientId, 
      measure: entity.measure);
  }

  Map<String, dynamic> toJson() => {
        'ingredientId':ingredientId,
        'measure':MeasureModel.fromEntity(measure!).toJson()
      };

}