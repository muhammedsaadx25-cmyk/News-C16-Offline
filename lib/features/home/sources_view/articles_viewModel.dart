import 'package:flutter/material.dart';
import 'package:news_app_offline/data/api/api_service.dart' ;
import 'package:news_app_offline/data/api/models/Sources_response/Source.dart' ;
import 'package:news_app_offline/data/api/models/articles_response/Article.dart' ;
import 'package:news_app_offline/data/api/result.dart';
import 'package:news_app_offline/repositories/articles_repository.dart';


class ArticlesViewModel extends ChangeNotifier{
  ArticlesRepository articlesRepository;
  ArticlesViewModel({required this.articlesRepository});
  List<Article> articles = [];
  bool isLoading  = false;
  String? errorMessage;
  void fetchArticles(Source source)async{
    isLoading = true;
    notifyListeners();
  var result = await   articlesRepository.getArticles(source);
  isLoading = false ;
  notifyListeners();
 switch(result){
   case Success():{
    articles = result.data;
   }
   case ServerError():{
     errorMessage = result.message;
   }
   case Error():{
    errorMessage = result.exception;
   }
 }
 notifyListeners();

  }
}