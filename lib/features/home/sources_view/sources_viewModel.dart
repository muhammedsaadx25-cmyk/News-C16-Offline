import 'package:flutter/material.dart';
import 'package:news_app_offline/api/api_service.dart';
import 'package:news_app_offline/api/models/Sources_response/Source.dart' show Source;
import 'package:news_app_offline/api/models/Sources_response/SourcesResponse.dart';
import 'package:news_app_offline/api/result.dart';
import 'package:news_app_offline/models/category_model.dart';

class SourcesViewModel extends ChangeNotifier {
  List<Source> sources = [];
  bool isLoading = false;
  String? errorMessage ;
  Future<void> fetchSources(CategoryModel category) async {
    isLoading = true;
    notifyListeners();
   var result = await APIService.getSources(category);
   isLoading = false;
   notifyListeners();
   switch(result){
     case Success():{
       sources = result.data;
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