import 'package:healthy_app/features/meal/domain/entities/ingredient.dart';
import 'package:healthy_app/features/meal/domain/entities/measure.dart';
import 'package:healthy_app/features/meal/domain/entities/nutrition.dart';

class IngredientValueEntity {
   int ? ingredientId;
   MeasureEntity ? measure;
  late  NutritionEntity nutritionValue;

  IngredientValueEntity({
    required this.ingredientId,
    required this.measure,
  });

  static List<IngredientValueEntity> getBlueberryIngredients(){
    //List<IngredientEntity> allIngredients=IngredientEntity.getIngredients();
    List<IngredientValueEntity> bpIngredients=[];
    bpIngredients.add(IngredientValueEntity(ingredientId:1, measure: MeasureEntity(measureType: MeasureType.g, value: 100)));
    bpIngredients.add(IngredientValueEntity(ingredientId:2,  measure: MeasureEntity(measureType: MeasureType.tbsp, value: 3)));
    bpIngredients.add(IngredientValueEntity(ingredientId:3,  measure: MeasureEntity(measureType: MeasureType.tsp, value: 2)));
    bpIngredients.add(IngredientValueEntity(ingredientId:4,  measure: MeasureEntity(measureType: MeasureType.items, value: 2)));
    return bpIngredients;
  }

  static List<IngredientValueEntity> getCanaiBreadIngredients(){
    //List<IngredientEntity> allIngredients=IngredientEntity.getIngredients();
    List<IngredientValueEntity> cbIngredients=[];

    cbIngredients.add(IngredientValueEntity(ingredientId:1, measure: MeasureEntity(measureType: MeasureType.g, value: 520)));
    cbIngredients.add(IngredientValueEntity(ingredientId:4, measure: MeasureEntity(measureType: MeasureType.items, value: 1)));
    cbIngredients.add(IngredientValueEntity(ingredientId:5, measure: MeasureEntity(measureType: MeasureType.g, value: 40)));

    return cbIngredients;
  }
  
}