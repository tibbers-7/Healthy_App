import 'package:healthy_app/core/resources/data_state.dart';
import 'package:healthy_app/core/usecases/usecase.dart';
import 'package:healthy_app/features/meal/domain/entities/meal.dart';
import 'package:healthy_app/features/meal/domain/repository/meal_repository.dart';


class GetMealUseCase implements UseCase<DataState<List<MealEntity>>,void>{
  
  final MealRepository _mealRepository;

  GetMealUseCase(this._mealRepository);
  
  @override
  Future<DataState<List<MealEntity>>> call({void params}) {
    return _mealRepository.getMeals();
  }
  
}