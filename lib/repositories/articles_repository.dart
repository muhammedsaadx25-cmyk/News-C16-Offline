import 'package:news_app_offline/data/api/models/Sources_response/Source.dart';
import 'package:news_app_offline/data/api/models/articles_response/Article.dart';
import 'package:news_app_offline/data/api/result.dart';

abstract class ArticlesRepository{
  Future<Result<List<Article>>>  getArticles(Source source);
}