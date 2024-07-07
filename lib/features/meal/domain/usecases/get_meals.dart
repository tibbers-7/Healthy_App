import 'package:healthy_app/core/resources/data_state.dart';
import 'package:healthy_app/core/usecases/usecase.dart';
import 'package:healthy_app/features/meal/domain/entities/meal.dart';
import 'package:healthy_app/features/meal/domain/repository/meal_repository.dart';


class GetMealsUseCase implements UseCase<List<MealEntity>,void>{
  
  final MealRepository _mealRepository;

  GetMealsUseCase(this._mealRepository);
  
  @override
  Future<List<MealEntity>> call({void params}) {
    return _mealRepository.getMeals();
  }

  
}