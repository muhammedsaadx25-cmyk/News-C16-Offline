import 'package:news_app_offline/data/api/api_service.dart';
import 'package:news_app_offline/data/api/models/Sources_response/Source.dart';
import 'package:news_app_offline/data/api/models/articles_response/Article.dart';
import 'package:news_app_offline/data/api/result.dart';
import 'package:news_app_offline/data/data_sources/articles_datasource.dart';

class ArticlesApiDataSource implements ArticlesDataSource{


  APIService apiService;
  ArticlesApiDataSource({required this.apiService});
  @override
  Future<Result<List<Article>>> getArticles(Source source) {
  return  apiService.getArticles(source);
  }

}