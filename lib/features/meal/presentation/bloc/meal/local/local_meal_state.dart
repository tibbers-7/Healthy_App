import 'package:equatable/equatable.dart';
import 'package:healthy_app/features/meal/domain/entities/meal.dart';

abstract class LocalMealState extends Equatable {
  final List<MealEntity> ? meals;

  const LocalMealState({this.meals});

  @override
  List<Object> get props => [meals!];
}

class LocalMealsLoading extends LocalMealState {
  const LocalMealsLoading();
}

class LocalMealsDone extends LocalMealState {
  const LocalMealsDone(List<MealEntity> meals) : super(meals: meals);
}