import 'package:flutter/material.dart';
import 'package:news_app_offline/data/api/api_service.dart';
import 'package:news_app_offline/data/api/models/Sources_response/Source.dart';
import 'package:news_app_offline/data/api/result.dart';
import 'package:news_app_offline/models/category_model.dart';
import 'package:news_app_offline/repositories/sources_repository.dart';

class SourcesViewModel extends ChangeNotifier {
  SourcesRepository sourcesRepository;
  SourcesViewModel({required this.sourcesRepository});
  List<Source> sources = [];
  bool isLoading = false;
  String? errorMessage ;
  Future<void> fetchSources(CategoryModel category) async {
    isLoading = true;
    notifyListeners();
   var result = await sourcesRepository.getSources(category);
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