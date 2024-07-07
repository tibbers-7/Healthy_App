import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_app/features/meal/domain/usecases/get_meals.dart';
import 'package:healthy_app/features/meal/presentation/bloc/meal/local/local_meal_event.dart';
import 'package:healthy_app/features/meal/presentation/bloc/meal/local/local_meal_state.dart';

class LocalMealBloc extends Bloc<LocalMealEvent,LocalMealState> {
  final GetMealsUseCase _getMealsUseCase;

  LocalMealBloc(
    this._getMealsUseCase,
  ) : super(const LocalMealsLoading()){
    on <GetMeals> (onGetMeals);
  }


  void onGetMeals(GetMeals event,Emitter<LocalMealState> emit) async {
    final articles = await _getMealsUseCase();
    emit(LocalMealsDone(articles));
  }

}