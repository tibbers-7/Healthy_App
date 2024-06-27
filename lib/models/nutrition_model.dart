import 'package:sample_app/models/ingredient_model.dart';

class NutritionModel{
  double caloriesInKcal;
  double fats;
  double proteins;
  double carbs;
  double vitamins;
  double fibre;
  double minerals;

  NutritionModel({
    required this.caloriesInKcal,
    required this.fats,
    required this.proteins,
    required this.carbs,
    required this.vitamins,
    required this.fibre,
    required this.minerals,

  });

  NutritionModel.empty({
    this.caloriesInKcal=0,
    this.carbs=0,
    this.fats=0,
    this.fibre=0,
    this.minerals=0,
    this.proteins=0,
    this.vitamins=0
  });

  static NutritionModel getTotalIngredientNutrition(NutritionModel other,double quantity){
    return NutritionModel(
      caloriesInKcal:other.caloriesInKcal*quantity,
      carbs:other.carbs*quantity,
      fats:other.fats*quantity,
      fibre:other.fibre*quantity,
      minerals:other.minerals*quantity,
      proteins:other.proteins*quantity,
      vitamins:other.vitamins*quantity
    );
  }

  NutritionModel operator +(NutritionModel other) {
    return NutritionModel(
      caloriesInKcal: caloriesInKcal + other.caloriesInKcal,
      carbs: carbs + other.carbs,
      fats: fats + other.fats,
      fibre: fibre + other.fibre,
      minerals: minerals + other.minerals,
      proteins: proteins + other.proteins,
      vitamins: vitamins + other.vitamins,
    );
  }
}