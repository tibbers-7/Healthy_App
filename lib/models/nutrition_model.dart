
class NutritionModel{
  double calories; 
  double fats;
  double proteins;
  double carbs;
  double vitamins;
  double fibre;
  double minerals;

  NutritionModel({
    required this.calories,
    required this.fats,
    required this.proteins,
    required this.carbs,
    required this.vitamins,
    required this.fibre,
    required this.minerals,

  });

  NutritionModel.empty({
    this.calories=0,
    this.carbs=0,
    this.fats=0,
    this.fibre=0,
    this.minerals=0,
    this.proteins=0,
    this.vitamins=0
  });

  Map<String, dynamic> toMap() {
    return {
      'proteins': proteins,
      'fats': fats,
      'calories':calories,
      'carbs': carbs,
      'fibre': fibre,
      'minerals': minerals,
      'vitamins': vitamins,
    };
  }

  static double getNutrientByName(NutritionModel nutrition, String nutrientName){
    var map = nutrition.toMap();
    return map[nutrientName];
  }

  static NutritionModel getTotalIngredientNutrition(NutritionModel other,double quantity){
    return NutritionModel(
      calories:(other.calories*quantity).round().toDouble(),
      carbs:other.carbs*quantity,
      fats:other.fats*quantity,
      fibre:other.fibre*quantity,
      minerals:other.minerals*quantity,
      proteins:(other.proteins*quantity).round().toDouble(),
      vitamins:other.vitamins*quantity
    );
  }

  NutritionModel operator +(NutritionModel other) {
    return NutritionModel(
      calories: calories + other.calories,
      carbs: carbs + other.carbs,
      fats: fats + other.fats,
      fibre: fibre + other.fibre,
      minerals: minerals + other.minerals,
      proteins: proteins + other.proteins,
      vitamins: vitamins + other.vitamins,
    );
  }
}