import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:healthy_app/features/meal/data/data_sources/local/app_database.dart';
import 'package:healthy_app/features/meal/data/data_sources/remote/news_api_service.dart';
import 'package:healthy_app/features/meal/data/repository/article_repository.dart';
import 'package:healthy_app/features/meal/data/repository/meal_repository_impl.dart';
import 'package:healthy_app/features/meal/domain/repository/article_repository.dart';
import 'package:healthy_app/features/meal/domain/repository/meal_repository.dart';
import 'package:healthy_app/features/meal/domain/usecases/get_article.dart';
import 'package:healthy_app/features/meal/domain/usecases/get_meal.dart';
import 'package:healthy_app/features/meal/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl=GetIt.instance;

Future<void> initializeDependencies() async {

  final db=await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(db);

  sl.registerSingleton<Dio>(Dio());

  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(
    ArticleRepositoryImpl(sl())
  );

  sl.registerSingleton<MealRepository>(
    MealRepositoryImpl(db)
  );

  sl.registerSingleton<GetMealsUseCase>(
    GetMealsUseCase(sl())
  );
  

  sl.registerSingleton<GetArticleUseCase>(
    GetArticleUseCase(sl())
  );

// presentation logic blocs shouldnt be singletons 
  sl.registerFactory<RemoteArticleBloc> (
    ()=> RemoteArticleBloc(sl<GetArticleUseCase>())
  );
}