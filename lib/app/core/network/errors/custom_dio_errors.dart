import 'package:dio/dio.dart';

class HttpClientErrors extends DioError{
  HttpClientErrors({required RequestOptions requestOptions, dynamic error, Response<dynamic>? response, DioErrorType type = DioErrorType.other}) : super(requestOptions: requestOptions, error: error,response: response,type: type);
  
  
} 