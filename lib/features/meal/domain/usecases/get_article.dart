import 'package:healthy_app/core/resources/data_state.dart';
import 'package:healthy_app/core/usecases/usecase.dart';
import 'package:healthy_app/features/meal/domain/entities/article.dart';
import 'package:healthy_app/features/meal/domain/repository/article_repository.dart';


class GetArticleUseCase implements UseCase<DataState<List<ArticleEntity>>,void>{
  
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);
  
  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getArticles();
  }
  
}