import 'package:flutter/material.dart';
import 'package:news_app_offline/features/home/categories_view/categories_view.dart';
import 'package:news_app_offline/features/home/sources_view/sources_view.dart';
import 'package:news_app_offline/models/category_model.dart';

class HomeProvider extends ChangeNotifier{
  Widget homeView = CategoriesView();
String title = "Home";

  void goToSourcesView(CategoryModel category){
    homeView = SourcesView(category: category);
    title = category.title;
    notifyListeners();
  }
  void goToCategoriesView(){
    homeView = CategoriesView();
    title = "home";
    notifyListeners();
  }
}