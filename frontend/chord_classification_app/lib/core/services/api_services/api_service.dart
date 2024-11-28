import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../interceptors/cache_interceptors.dart';

typedef QueryType = Map<String, dynamic>?;

class ApiManager {
  final _connectTimeout = const Duration(seconds: 10);
  final _receiveTimeout = const Duration(seconds: 10);
  final _sendTimeout = const Duration(seconds: 10);

  /// Dio instance used for API requests.
  late Dio dio;

  ApiManager(Ref ref) {
    Map<String, dynamic> headers = {};
    BaseOptions options = BaseOptions(
        baseUrl: dotenv.get('BASEURL'),
        connectTimeout: _connectTimeout,
        receiveTimeout: _receiveTimeout,
        sendTimeout: _sendTimeout,
        responseType: ResponseType.json,
        contentType: Headers.jsonContentType,
        headers: headers);

    dio = Dio(options);

    dio.interceptors.add(ref.read(cacheResolverProvider));
  }

  Future<Response> get(String path,
      {Options? options, Map<String, dynamic>? queryParameters}) async {
    return await dio.get(path,
        queryParameters: queryParameters, options: options);
  }

  Future<Response> post(String path,
      {Options? options, Map<String, dynamic>? data}) async {
    return await dio.post(path, data: data, options: options);
  }
  //TODO Add File Upload/Delete/Patch/Put
}
