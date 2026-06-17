import 'package:bookly_clean_arch/core/database/api/api_consumer.dart';
import 'package:bookly_clean_arch/core/database/api/end_points.dart';
import 'package:bookly_clean_arch/core/errors/expentions.dart';
import 'package:dio/dio.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
    );
  }
  @override
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? quearyParams,
    data,
  }) async {
    try {
      final response = await dio.get(
        path,
        queryParameters: quearyParams,
        data: data,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? quearyParams,
    data,
    bool isFormData = false,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<dynamic> patch(
    String path, {
    Map<String, dynamic>? quearyParams,
    data,
    bool isFormData = false,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<dynamic> delete(
    String path, {
    Map<String, dynamic>? quearyParams,
    data,
    bool isFormData = false,
  }) {
    throw UnimplementedError();
  }
}
