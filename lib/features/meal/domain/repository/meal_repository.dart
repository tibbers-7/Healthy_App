import 'package:healthy_app/core/resources/data_state.dart';
import 'package:healthy_app/features/meal/domain/entities/meal.dart';

abstract class MealRepository{
  Future<List<MealEntity>> getMeals();
  Future<MealEntity> getMeal(int id);
}