import 'package:floor/floor.dart';
import 'package:healthy_app/features/meal/data/models/meal.dart';

@dao
abstract class MealDao{
  @Insert()
  Future<void> insertMeal(MealModel meal);

  @delete
  Future<void> deleteMeal(MealModel meal);

  @Query('SELECT * FROM meal')
  Future<List<MealModel>> getMeals();

  @Query('SELECT * FROM meal WHERE id= :id')
  Future<MealModel?> getMeal(int id);
}