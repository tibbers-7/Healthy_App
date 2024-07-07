import 'package:equatable/equatable.dart';
import 'package:healthy_app/features/meal/domain/entities/nutrition.dart';

class IngredientEntity extends Equatable{
  final int ? id;
  final String ? name;
  final NutritionEntity ? nutritionValue;
  final String ? iconPath;

  const IngredientEntity({
    required this.id,
    required this.name,
    required this.nutritionValue,
    required this.iconPath
  });

  NutritionEntity getTotalIngredientNutrition(double? quantity){
    if(nutritionValue==null || quantity==null) return NutritionEntity.empty();
    return NutritionEntity(
      calories: (nutritionValue!.calories*quantity).round().toDouble(),
      carbs:nutritionValue!.carbs*quantity,
      fats:nutritionValue!.fats*quantity,
      fibre:nutritionValue!.fibre*quantity,
      minerals:nutritionValue!.minerals*quantity,
      proteins:(nutritionValue!.proteins*quantity).round().toDouble(),
      vitamins:nutritionValue!.vitamins*quantity
    );
  }

  static List<IngredientEntity> getIngredients(){
    List<IngredientEntity> ingredients=[];

    ingredients.add(IngredientEntity(id:1,name: 'Wheat Flour', iconPath: 'assets/icons/Flour.svg',nutritionValue: NutritionEntity(calories: 3.40,proteins: 0.132,carbs: 0.72,fibre: 0.107,fats: 0.025, vitamins: 0, minerals: 0), ));
    ingredients.add(IngredientEntity(id:2,name: 'Sugar', iconPath: 'assets/icons/Sugar.svg',nutritionValue: NutritionEntity(calories: 3.85,proteins: 0,carbs: 1,fibre: 0,fats: 0, vitamins: 0, minerals: 0), ));
    ingredients.add(IngredientEntity(id:3,name: 'Baking Soda', iconPath: 'assets/icons/BakingSoda.svg',nutritionValue: NutritionEntity(calories: 0,proteins: 0,carbs: 0,fibre: 0,fats: 0, vitamins: 0, minerals: 0.274), ));
    ingredients.add(IngredientEntity(id:4,name: 'Egg', iconPath: 'assets/icons/Eggs.svg',nutritionValue: NutritionEntity(calories: 78,proteins: 6,carbs: 0.6,fibre: 0,fats: 5, vitamins: 1.127, minerals: 0.243), ));
    ingredients.add(IngredientEntity(id: 5, name: 'Butter', iconPath: 'assets/icons/Butter.svg',nutritionValue: NutritionEntity(calories: 7.28, proteins: 0.006, carbs:0.0007, fats: 0, vitamins: 0, fibre: 0, minerals: 0,)));
    return ingredients;
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}