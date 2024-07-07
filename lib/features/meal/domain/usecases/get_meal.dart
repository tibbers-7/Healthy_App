import 'package:healthy_app/core/usecases/usecase.dart';
import 'package:healthy_app/features/meal/domain/entities/meal.dart';
import 'package:healthy_app/features/meal/domain/repository/meal_repository.dart';


class GetMealsUseCase implements UseCase<MealEntity,int>{
  
  final MealRepository _mealRepository;

  GetMealsUseCase(this._mealRepository);
  
  @override
   Future<MealEntity> call({int ? params}){
    return _mealRepository.getMeal(params!);
  }

  
}