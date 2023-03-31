import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hackathonmobile/core/utils/app_utils_function.dart';
import 'logging_interceptor.dart';

class DioClient {
  final String baseUrl;
  LoggingInterceptor? loggingInterceptor = LoggingInterceptor();

  Dio dio = Dio();

  DioClient(this.baseUrl) {
    //token = sharedPreferences.getString(AppConstants.TOKEN);
    //print(token);
    dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = const Duration(seconds: 15)
      ..options.receiveTimeout = const Duration(seconds: 15)
      ..httpClientAdapter;

    dio.interceptors.add(loggingInterceptor!);
  }

  Map<String, String> getHeaders1(bool autorisation) {
    Map<String, String> res = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    };
    return res;
  }

  Future<Response> get(
    String uri, {
    bool withAuthorization = false,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      logd('------- HEADERS -------');
      logd(getHeaders1(true));
      var response = await dio.get(
        uri,
        queryParameters: queryParameters,
        options: Options(headers: getHeaders1(withAuthorization)),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
    String uri, {
    data,
    bool withAuthorization = false,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      logd(data);
      var response = await dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: getHeaders1(withAuthorization)),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: getHeaders(),
        ),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(
    String uri, {
    data,
    bool withAuthorization = false,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var response = await dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  getHeaders() {
    Map<String, String> header = {
      'Accept': 'application/json',
      'Content-Type': 'multipart/form-data'
    };
    return header;
  }

  Future<dynamic> postFile({
    required FormData body,
    String url = '',
  }) async {
    Response result;
    try {
      logd(body);
      result = await dio.post(url,
          data: body,
          options: Options(
            headers: getHeaders(),
          ));
      return result;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.response?.data.toString());

        print(url);
      }
      return null;
    }
  }
}
