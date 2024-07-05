import 'package:healthy_app/core/resources/data_state.dart';
import 'package:healthy_app/core/usecases/usecase.dart';
import 'package:healthy_app/features/meal/domain/entities/ingredient.dart';
import 'package:healthy_app/features/meal/domain/repository/ingredient_repository.dart';


class GetIngredientUseCase implements UseCase<DataState<List<IngredientEntity>>,void>{
  
  final IngredientRepository _ingredientRepository;

  GetIngredientUseCase(this._ingredientRepository);
  
  @override
  Future<DataState<List<IngredientEntity>>> call({void params}) {
    return _ingredientRepository.getIngredients();
  }
  
}