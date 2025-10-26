
import 'package:news_app_offline/api/models/Sources_response/Source.dart';

abstract class Result<T>{}
class Success<T> extends Result<T>{
  T data;
  Success({required this.data});
}
class ServerError<T> extends Result<T>{
  String message;
  ServerError({required this.message});
}

class Error<T> extends Result<T>{
  String exception;
  Error({required this.exception});
}

