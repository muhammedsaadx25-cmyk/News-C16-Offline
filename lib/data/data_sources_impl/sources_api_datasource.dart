import 'package:news_app_offline/data/api/api_service.dart';
import 'package:news_app_offline/data/api/models/Sources_response/Source.dart' show Source;
import 'package:news_app_offline/data/api/result.dart' show Result;
import 'package:news_app_offline/data/data_sources/sources_datasource.dart';
import 'package:news_app_offline/models/category_model.dart' show CategoryModel;

class SourcesAPiDataSource implements SourcesDataSource{
   APIService apiService;
  SourcesAPiDataSource({required this.apiService});
  @override
  Future<Result<List<Source>>> getSources(CategoryModel category) async{
    var result = await apiService.getSources(category);
    return result;

  }
}