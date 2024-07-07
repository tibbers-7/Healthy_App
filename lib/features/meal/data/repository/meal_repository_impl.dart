import 'package:healthy_app/core/resources/data_state.dart';
import 'package:healthy_app/features/meal/domain/entities/meal.dart';
import 'package:healthy_app/features/meal/domain/repository/meal_repository.dart';

import '../data_sources/local/app_database.dart';

class MealRepositoryImpl implements MealRepository{

  final AppDatabase _appDatabase;

  MealRepositoryImpl(this._appDatabase);
  
  @override
  Future<MealEntity> getMeal(int id) {
    // TODO: implement getMeal
    throw UnimplementedError();
  }

  @override
  Future<List<MealEntity>> getMeals() async {
    return _appDatabase.mealDAO.getMeals();
  }
  
}