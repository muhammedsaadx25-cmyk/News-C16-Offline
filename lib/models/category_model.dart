import 'package:flutter/material.dart';
import 'package:news_app_offline/core/assets_manager.dart';

class CategoryModel{
  String id;
  String title;
  String imagePath;

  CategoryModel({required this.id, required this.title,required this.imagePath,});

  static List<CategoryModel> categories = [
    CategoryModel(id: "general", title: "General",  imagePath: ImageAssets.general),

    CategoryModel(id: "sports", title: "Sports",  imagePath: ImageAssets.sports),
    CategoryModel(id: "business", title: "Business",  imagePath: ImageAssets.business),
    CategoryModel(id: "entertainment", title: "Entertainment",  imagePath: ImageAssets.entertainment),
    CategoryModel(id: "health", title: "health",  imagePath: ImageAssets.health),
    CategoryModel(id: "science", title: "Science",  imagePath: ImageAssets.science),
    CategoryModel(id: "technology", title: "Technology",  imagePath: ImageAssets.technology),
  ];
}