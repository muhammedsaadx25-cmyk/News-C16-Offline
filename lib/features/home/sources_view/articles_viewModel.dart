import 'package:flutter/material.dart';
import 'package:news_app_offline/api/api_service.dart';
import 'package:news_app_offline/api/models/Sources_response/Source.dart';
import 'package:news_app_offline/api/models/articles_response/Article.dart' show Article;
import 'package:news_app_offline/api/models/articles_response/ArticlesResponse.dart';
import 'package:news_app_offline/api/result.dart';

class ArticlesViewModel extends ChangeNotifier{
  List<Article> articles = [];
  bool isLoading  = false;
  String? errorMessage;
  void fetchArticles(Source source)async{
    isLoading = true;
    notifyListeners();
  var result = await   APIService.getArticles(source);
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