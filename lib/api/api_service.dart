import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:news_app_offline/api/models/Sources_response/Source.dart';
import 'package:news_app_offline/api/models/Sources_response/SourcesResponse.dart';
import 'package:news_app_offline/api/models/articles_response/Article.dart';
import 'package:news_app_offline/api/models/articles_response/ArticlesResponse.dart';
import 'package:news_app_offline/api/result.dart';
import 'package:news_app_offline/models/category_model.dart';
import 'package:http/http.dart' as http;

class APIService {
  static const String baseURL = "newsapi.org";
  static const String APIKey = "811d8ca53d0d4ff281843e66552efcee";
  static const String sourcesEndPoint = "/v2/top-headlines/sources";
  static const String articlesEndPoint = "v2/everything";

  static Future<Result<List<Source>>> getSources(CategoryModel category) async {
    try{
      Uri url = Uri.https(baseURL, sourcesEndPoint, {
        "apiKey": APIKey,
        "category": category.id,
      });
      http.Response serverResponse = await http.get(url);
      var json = jsonDecode(serverResponse.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      if (sourcesResponse.status == "error") {
        return ServerError(message: sourcesResponse.message ?? '');
      } else {
        return Success(data: sourcesResponse.sources ?? []);
      }
    }catch(exception){
      return Error(exception: exception.toString());
    }
  }
  
  //https://newsapi.org/v2/everything?q=bitcoin&apiKey=811d8ca53d0d4ff281843e66552efcee
  static Future<Result<List<Article>>> getArticles(Source source)async{
    try{
      var url = Uri.https(baseURL, articlesEndPoint, {
        "apiKey": APIKey,
        "sources": source.id,
      });
      http.Response serverResponse = await http.get(url);
      var json = jsonDecode(serverResponse.body);
      ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
      if (articlesResponse.status == "error") {
        return ServerError(message: articlesResponse.message ?? '');
      } else {
        return Success(data: articlesResponse.articles ?? []);
      }
    }catch(exception){
      return Error(exception: exception.toString());
    }
  }
}
