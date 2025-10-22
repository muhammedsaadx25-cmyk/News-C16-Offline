import 'package:flutter/material.dart';
import 'package:news_app_offline/api/api_service.dart';
import 'package:news_app_offline/api/models/Sources_response/Source.dart';
import 'package:news_app_offline/api/models/articles_response/Article.dart' show Article;
import 'package:news_app_offline/api/models/articles_response/ArticlesResponse.dart';

class ArticlesProvider extends ChangeNotifier{
  List<Article> articles = [];
  bool isLoading  = false;
  void fetchArticles(Source source)async{
    isLoading = true;
    notifyListeners();
  ArticlesResponse articlesResponse = await   APIService.getArticles(source);
  isLoading = false ;
  notifyListeners();
  articles  = articlesResponse.articles ?? [];
  notifyListeners();
  }
}