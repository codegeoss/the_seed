import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:{{project_name.snakeCase()}}/core/core.dart';

class NetworkUtil {
  factory NetworkUtil() => _networkUtil;

  NetworkUtil._internal();

  static final NetworkUtil _networkUtil = NetworkUtil._internal();

  final _logger = Logger();

  Dio _getHttpClient() {
    final dio = Dio(
      BaseOptions(
        baseUrl: TiifuConfig.instance!.values.baseUrl,
        contentType: 'application/json',
        headers: {'Accept': 'application/json'},
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers['Authorization'] =
              'Bearer ${HiveServiceImplementation().retrieveToken() ?? ''}';
          return handler.next(options);
        },
        onError: (e, handler) async {
          return handler.next(e);
        },
      ),
    );

    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(requestHeader: true, requestBody: true),
      );
    }

    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
        HttpClient()..badCertificateCallback = (_, _, _) => true;

    return dio;
  }

  Future<Map<String, dynamic>> _handleResponse(
    Response<dynamic> response,
  ) async {
    final data = response.data;

    if (data is! Map<String, dynamic> || data.isEmpty) {
      throw Failure(
        message: 'An error occurred, please try again later',
        statusCode: response.statusCode,
      );
    }

    return data;
  }

  Failure _mapDioError(DioException err) {
    _logger
      ..e('Dio error: $err')
      ..i('Status: ${err.response?.statusCode}')
      ..i('Data: ${err.response?.data}');

    if (err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.unknown) {
      return Failure(message: 'An error occurred, please try again later');
    }

    final statusCode = err.response?.statusCode;
    final responseData = err.response?.data;

    var message = 'Server error';

    if (responseData is Map<String, dynamic>) {
      message = responseData['message']?.toString() ?? message;
    } else if (responseData is String) {
      message = 'An error occurred, please try again later';
    }

    return Failure(message: message, statusCode: statusCode);
  }

  Future<Map<String, dynamic>> getReq(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _getHttpClient().get<dynamic>(
        url,
        queryParameters: queryParameters,
      );
      return await _handleResponse(response);
    } on DioException catch (err) {
      throw _mapDioError(err);
    } on SocketException {
      throw Failure(message: 'No internet connection');
    } on TimeoutException {
      throw Failure(message: 'Request timed out');
    } on Exception catch (e) {
      _logger.e('Unexpected error: $e');
      throw Failure(message: 'Something went wrong. Please try again later');
    }
  }

  Future<Map<String, dynamic>> postReq(
    String url, {
    String? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _getHttpClient().post<dynamic>(
        url,
        data: body,
        queryParameters: queryParameters,
      );
      return await _handleResponse(response);
    } on DioException catch (err) {
      throw _mapDioError(err);
    } on SocketException {
      throw Failure(message: 'No internet connection');
    } on TimeoutException {
      throw Failure(message: 'Request timed out');
    } on Exception catch (e) {
      _logger.e('Unexpected error: $e');
      throw Failure(message: 'Something went wrong. Please try again later');
    }
  }

  Future<Map<String, dynamic>> patchReq(String url, {String? body}) async {
    try {
      final response = await _getHttpClient().patch<dynamic>(
        url,
        data: body,
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: 'application/merge-patch+json',
          },
        ),
      );
      return await _handleResponse(response);
    } on DioException catch (err) {
      throw _mapDioError(err);
    } on SocketException {
      throw Failure(message: 'No internet connection');
    } on TimeoutException {
      throw Failure(message: 'Request timed out');
    } on Exception catch (e) {
      _logger.e('Unexpected error: $e');
      throw Failure(message: 'Something went wrong. Please try again later');
    }
  }

  Future<Map<String, dynamic>> putReq(String url, {String? body}) async {
    try {
      final response = await _getHttpClient().put<dynamic>(url, data: body);
      return await _handleResponse(response);
    } on DioException catch (err) {
      throw _mapDioError(err);
    } on SocketException {
      throw Failure(message: 'No internet connection');
    } on TimeoutException {
      throw Failure(message: 'Request timed out');
    } on Exception catch (e) {
      _logger.e('Unexpected error: $e');
      throw Failure(message: 'Something went wrong. Please try again later');
    }
  }

  Future<Map<String, dynamic>> deleteReq(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _getHttpClient().delete<dynamic>(
        url,
        queryParameters: queryParameters,
      );
      return await _handleResponse(response);
    } on DioException catch (err) {
      throw _mapDioError(err);
    } on SocketException {
      throw Failure(message: 'No internet connection');
    } on TimeoutException {
      throw Failure(message: 'Request timed out');
    } on Exception catch (e) {
      _logger.e('Unexpected error: $e');
      throw Failure(message: 'Something went wrong. Please try again later');
    }
  }

  Future<Map<String, dynamic>> multipartReq(
    String url, {
    required Map<String, dynamic> body,
    String? filePath,
    String? fileKey,
  }) async {
    try {
      final formData = FormData.fromMap(body);

      if (filePath != null) {
        final fileName = filePath.split('/').last;
        final file = await MultipartFile.fromFile(filePath, filename: fileName);
        formData.files.add(MapEntry(fileKey ?? 'media_file', file));
      }

      final response = await _getHttpClient().post<dynamic>(
        url,
        data: formData,
        options: Options(
          contentType: 'multipart/form-data',
          headers: {'Accept': '*/*'},
        ),
      );

      return await _handleResponse(response);
    } on DioException catch (err) {
      throw _mapDioError(err);
    } on SocketException {
      throw Failure(message: 'No internet connection');
    } on TimeoutException {
      throw Failure(message: 'Request timed out');
    } on Exception catch (e) {
      _logger.e('Unexpected error: $e');
      throw Failure(message: 'Something went wrong. Please try again later');
    }
  }
}
