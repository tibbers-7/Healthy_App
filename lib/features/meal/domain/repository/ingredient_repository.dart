import 'package:healthy_app/core/resources/data_state.dart';
import 'package:healthy_app/features/meal/domain/entities/ingredient.dart';

abstract class IngredientRepository{
  Future<DataState<List<IngredientEntity>>> getIngredients();
}