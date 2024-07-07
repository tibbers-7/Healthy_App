import 'package:equatable/equatable.dart';
import 'package:healthy_app/features/meal/domain/entities/meal.dart';

abstract class LocalMealEvent extends Equatable {
  final MealEntity ? meal;

  const LocalMealEvent({this.meal});

  @override
  List<Object> get props => [meal!];
}

class GetMeals extends LocalMealEvent {
  const GetMeals();
}