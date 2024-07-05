
class NutritionEntity{
  double calories; 
  double fats;
  double proteins;
  double carbs;
  double vitamins;
  double fibre;
  double minerals;

  NutritionEntity({
    required this.calories,
    required this.fats,
    required this.proteins,
    required this.carbs,
    required this.vitamins,
    required this.fibre,
    required this.minerals,

  });

  NutritionEntity.empty({
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

  static double getNutrientByName(NutritionEntity nutrition, String nutrientName){
    var map = nutrition.toMap();
    return map[nutrientName];
  }

  static NutritionEntity getTotalIngredientNutrition(NutritionEntity? other,double? quantity){
    if(other==null || quantity==null) return NutritionEntity.empty();
    return NutritionEntity(
      calories:(other.calories*quantity).round().toDouble(),
      carbs:other.carbs*quantity,
      fats:other.fats*quantity,
      fibre:other.fibre*quantity,
      minerals:other.minerals*quantity,
      proteins:(other.proteins*quantity).round().toDouble(),
      vitamins:other.vitamins*quantity
    );
  }

  NutritionEntity operator +(NutritionEntity other) {
    return NutritionEntity(
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