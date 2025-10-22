import 'dart:convert';

import 'package:news_app_offline/api/models/Sources_response/Source.dart';
import 'package:news_app_offline/api/models/Sources_response/SourcesResponse.dart';
import 'package:news_app_offline/api/models/articles_response/ArticlesResponse.dart';
import 'package:news_app_offline/models/category_model.dart';
import 'package:http/http.dart' as http;

class APIService {
  static const String baseURL = "newsapi.org";
  static const String APIKey = "811d8ca53d0d4ff281843e66552efcee";
  static const String sourcesEndPoint = "/v2/top-headlines/sources";
  static const String articlesEndPoint = "v2/everything";

  static Future<SourcesResponse> getSources(CategoryModel category) async {
    Uri url = Uri.https(baseURL, sourcesEndPoint, {
      "apiKey": APIKey,
      "category": category.id,
    });
    http.Response serverResponse = await http.get(url);
    var json = jsonDecode(serverResponse.body);
    return SourcesResponse.fromJson(json);
  }
  
  //https://newsapi.org/v2/everything?q=bitcoin&apiKey=811d8ca53d0d4ff281843e66552efcee
  static Future<ArticlesResponse> getArticles(Source source)async{

    var url = Uri.https(baseURL,articlesEndPoint, {
      "apiKey": APIKey,
      "sources": source.id,
    });
   http.Response serverResponse = await http.get(url);
  var json =  jsonDecode(serverResponse.body);
  return ArticlesResponse.fromJson(json);
  }
}
