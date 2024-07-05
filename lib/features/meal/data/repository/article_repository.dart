import 'dart:io';

import 'package:dio/dio.dart';
import 'package:healthy_app/core/constants/constants.dart';
import 'package:healthy_app/core/resources/data_state.dart';
import 'package:healthy_app/features/meal/data/data_sources/remote/news_api_service.dart';
import 'package:healthy_app/features/meal/data/models/article.dart';
import 'package:healthy_app/features/meal/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository{
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getArticles() async{
    try{
    final httpResponse=await _newsApiService.getNewsArticles(
      apiKey: newsAPIKey,
      country: countryQuery,
      category: categoryQuery
    );

    if (httpResponse.response.statusCode==HttpStatus.ok){
      return DataSuccess(httpResponse.data);
    } else {
      return DataFailed(
        DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioExceptionType.badResponse,
        )
      );
      
    }
    } on DioException catch(e){
      return DataFailed(e);
    }
  }

}