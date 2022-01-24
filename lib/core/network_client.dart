import 'package:dio/dio.dart';
import 'package:flutter_riverpod_statenotifier_boilerplate/core/logger.dart';

export 'package:dio/dio.dart';

class NetworkClient {
  static late Dio client;

  static Future<void> init() async {
    client = Dio(
      BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com',
      ),
    );

    client.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) {
          Logger.info(request.uri.toString(), 'Request ${request.method}');
          handler.next(request);
        },
        onResponse: (response, handler) {
          Logger.info(response.realUri.toString(), 'Response ${response.requestOptions.method} ${response.statusCode}');
          handler.next(response);
        },
        onError: (error, handler) {
          Logger.error(error.message, 'Error ${error.requestOptions.method} ${error.response?.statusCode}');
          handler.next(error);
        },
      ),
    );
  }
}

mixin BaseRepository {
  var client = NetworkClient.client;
}
