import 'package:news_app_offline/data/api/api_service.dart';
import 'package:news_app_offline/data/api/models/Sources_response/Source.dart';
import 'package:news_app_offline/data/api/result.dart';
import 'package:news_app_offline/data/data_sources/sources_datasource.dart';
import 'package:news_app_offline/data/data_sources_impl/sources_api_datasource.dart';
import 'package:news_app_offline/models/category_model.dart';
import 'package:news_app_offline/repositories/sources_repository.dart';

class SourcesRepositoryImpl implements SourcesRepository {
   SourcesDataSource sourcesDataSource;

  SourcesRepositoryImpl({required this.sourcesDataSource}) ;

  @override
  Future<Result<List<Source>>> getSources(CategoryModel category)async {
    var result = await sourcesDataSource.getSources(category);
    return result;
  }
}
