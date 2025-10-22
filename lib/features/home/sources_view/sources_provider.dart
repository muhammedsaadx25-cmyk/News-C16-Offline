import 'package:flutter/material.dart';
import 'package:news_app_offline/api/api_service.dart';
import 'package:news_app_offline/api/models/Sources_response/Source.dart' show Source;
import 'package:news_app_offline/api/models/Sources_response/SourcesResponse.dart';
import 'package:news_app_offline/models/category_model.dart';

class SourcesProvider extends ChangeNotifier {
  List<Source> sources = [];
  bool isLoading = false;
  Future<void> fetchSources(CategoryModel category) async {
    isLoading = true;
    notifyListeners();
   SourcesResponse sourcesResponse = await APIService.getSources(category);
   isLoading = false;
   notifyListeners();
   sources = sourcesResponse.sources ?? [];
   notifyListeners();
  }
}