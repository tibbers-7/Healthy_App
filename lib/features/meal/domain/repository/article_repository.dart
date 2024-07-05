import 'package:healthy_app/core/resources/data_state.dart';
import 'package:healthy_app/features/meal/domain/entities/article.dart';

abstract class ArticleRepository{
  Future<DataState<List<ArticleEntity>>> getArticles();
}