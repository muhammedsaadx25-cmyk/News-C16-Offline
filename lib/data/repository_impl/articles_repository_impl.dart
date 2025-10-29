import 'package:news_app_offline/data/api/models/Sources_response/Source.dart';
import 'package:news_app_offline/data/api/models/articles_response/Article.dart';
import 'package:news_app_offline/data/api/result.dart';
import 'package:news_app_offline/data/data_sources/articles_datasource.dart';
import 'package:news_app_offline/repositories/articles_repository.dart';

class ArticlesRepositoryImpl implements ArticlesRepository{

  ArticlesDataSource articlesDataSource;
  ArticlesRepositoryImpl({required this.articlesDataSource});
  @override
  Future<Result<List<Article>>> getArticles(Source source) {
    return articlesDataSource.getArticles(source);
  }

}