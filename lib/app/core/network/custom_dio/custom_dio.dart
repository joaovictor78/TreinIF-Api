import '/app/core/models/logged_user_po.dart';
import '../interceptors/interceptors.dart'as interceptors;
import '/app/core/network/interfaces/i_http_client.dart';
import 'package:dio/dio.dart';

class CustomDio implements IHttpClient {
  final Dio _client;
  CustomDio(this._client, String apiUrl) {
    _client.options.baseUrl = apiUrl;
    _client.options.headers["Accept"] = "*/*";
   // _client.options.connectTimeout = 5000;
    _client.interceptors.add(interceptors.Interceptors());
  }

  @override
  Future get(String endpoint, {dynamic queryParameters}) async {
    return await _client.get(endpoint, queryParameters: queryParameters);
  }

  @override
  Future post(String endpoint, {dynamic data}) async {
    return await _client.post(endpoint, data: data);
  }

  @override
  Future delete(String endpoint, {dynamic data}) async {
    return await _client.delete(endpoint, data: data);
  }

  @override
  Future put(String endpoint, {dynamic data}) async {
    return await _client.put(endpoint, data: data);
  }
}
