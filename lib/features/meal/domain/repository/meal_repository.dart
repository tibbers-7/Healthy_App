import 'package:healthy_app/core/resources/data_state.dart';
import 'package:healthy_app/features/meal/domain/entities/meal.dart';

abstract class MealRepository{
  Future<DataState<List<MealEntity>>> getMeals();
}