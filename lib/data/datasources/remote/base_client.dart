import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/utils.dart';
import 'package:shiftapp/data/repositories/local/local_repository.dart';
import 'package:shiftapp/data/repositories/user/user_repository.dart';

import 'api_exception.dart';

class ClientCreator {
  final Interceptor interceptor;
  ClientCreator(this.interceptor);
  Dio create() {
    final dio2 = Dio(); // Provide a dio instance
    dio2.options.connectTimeout = 60000 * 2;
    dio2.interceptors.add(LogInterceptor(responseBody: true));
    dio2.interceptors.add(interceptor);

    return dio2;
  }
}

class HeaderInterceptor extends Interceptor {
  final keyJson = "application/json";

  final keyAuthorization = "authorization";
  final keyApiKey = "apiKey";
  final apiKeyValue = "Nas@manpoweragent";
  final keyLanguage = "Language";
  final requestTypeKey = "IsAndroidRequest";

  final UserRepository userRepository;
  final LocalRepository localRepository;

  HeaderInterceptor(this.userRepository, this.localRepository);
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[keyAuthorization] =
        'Bearer ${userRepository.getAccessToken()}';
    options.headers[keyLanguage] = Get.locale!.languageCode.toString();
    options.headers[keyApiKey] = apiKeyValue;
    options.headers['platform'] = 'android';
    options.headers[requestTypeKey] = true;

    print('Header  Params ${options.headers}');
    print('Request  Params ${options.data}');

    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print('DIO ERROR onError ${err.response}');

    if (err.response != null) {
      Map<String, dynamic> data = json.decode(err.response.toString());

      final message = data.containsKey('message') ? data['message'] : "Error";
      final status = data.containsKey('status') ? data['status'] : "Error";
      String code = data.containsKey('code') ? data['code'] : "E";
      throw ApiException(message, code);
    } else {
      super.onError(err, handler);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    Map<String, dynamic> data = response.data;
    final message = data.containsKey('message') ? data['message'] : "Error";
    final status = data.containsKey('status') ? data['status'] : "Error";
    String code = data.containsKey('code') ? response.data['code'] : "E";
    print('onRespons ${response.statusCode} => ${code != 'Ok'}');
    if (status != 'success') {
      print('IS ERROR ${message}');
      // throw ApiException(message, code);
    }
  }
}
