import 'package:news_app_offline/data/api/models/Sources_response/Source.dart';
import 'package:news_app_offline/data/api/result.dart' show Result;
import 'package:news_app_offline/models/category_model.dart';

abstract class SourcesDataSource{
  Future <Result<List<Source>> >getSources(CategoryModel category);
}