import 'dart:async';

import 'package:dio/dio.dart';
import 'package:global_configuration/global_configuration.dart';

enum RequestType { Get, Post, Put, Delete }

class HttpClient {
  Dio _dio = Dio(BaseOptions(connectTimeout: 5000, receiveTimeout: 7000));
  String baseUrl = GlobalConfiguration().getString('serverUrl');
  String imageBaseUrl = GlobalConfiguration().getString('serverUrl');

  Future<Response<dynamic>> request(
    String url, {
    dynamic body,
    Map<String, dynamic> headers,
    RequestType type = RequestType.Get,
    Map<String, dynamic> queryParameters,
    String contentType = Headers.jsonContentType,
    ResponseType responseType = ResponseType.json,
  }) async {
    Response response;

    final options = Options(headers: headers, contentType: contentType, responseType: responseType);

    try {
      switch (type) {
        case RequestType.Get:
          {
            response = await _dio.get(baseUrl + url, queryParameters: queryParameters, options: options);
          }
          break;
        case RequestType.Post:
          {
            response = await _dio.post(
              baseUrl + url,
              queryParameters: queryParameters,
              data: body,
              options: options,
            );
          }
          break;
        case RequestType.Put:
          {
            response = await _dio.put(baseUrl + url, queryParameters: queryParameters, data: body, options: options);
          }
          break;
        case RequestType.Delete:
          {
            response = await _dio.delete(baseUrl + url, queryParameters: queryParameters, data: body, options: options);
          }
          break;
        default:
          throw UnimplementedError();
      }

      return response;
    } on DioError catch (e) {
      print('🌐🌐DIO ERROR $type for $url:🌐🌐\n' +
          '${e.response.statusCode}: ${e.response.statusMessage} ${e.response.data}\n' +
          e.toString());
      rethrow;
    }
  }
}
