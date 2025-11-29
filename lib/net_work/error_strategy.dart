import 'package:dio/dio.dart';
import 'package:api/net_work/api_error_model.dart';

abstract class ErrorStrategy {
  bool canHandle(DioException exception);
  ApiErrorModel handle(DioException exception);
}
