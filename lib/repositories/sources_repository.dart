import 'package:news_app_offline/data/api/models/Sources_response/Source.dart';
import 'package:news_app_offline/data/api/result.dart';
import 'package:news_app_offline/models/category_model.dart';

abstract class SourcesRepository{
  Future<Result<List<Source>>> getSources(CategoryModel category);
}