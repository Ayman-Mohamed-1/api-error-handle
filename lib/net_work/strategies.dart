import 'package:api/net_work/apiLocalStatusCode.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:api/net_work/api_error_model.dart';
import 'package:api/net_work/error_strategy.dart';

class ConnectionErrorStrategy implements ErrorStrategy {
  @override
  bool canHandle(DioException e) => e.type == DioExceptionType.connectionError;

  @override
  ApiErrorModel handle(DioException e) => ApiErrorModel(
    massege: 'Connection Error',
    statusCode: ApiLocalStatusCode.connectionTimeout,
    icon: Icons.wifi_off,
  );
}

class BadCertificateStrategy implements ErrorStrategy {
  @override
  bool canHandle(DioException e) => e.type == DioExceptionType.badCertificate;

  @override
  ApiErrorModel handle(DioException e) => ApiErrorModel(
    massege: 'Bad Certificate',
    statusCode: ApiLocalStatusCode.badCertificate,
    icon: Icons.error,
  );
}

class CancelErrorStrategy implements ErrorStrategy {
  @override
  bool canHandle(DioException e) => e.type == DioExceptionType.cancel;

  @override
  ApiErrorModel handle(DioException e) => ApiErrorModel(
    massege: 'Request Cancelled',
    statusCode: ApiLocalStatusCode.requestCancelled,
    icon: Icons.cancel,
  );
}

class ConnectionTimeoutStrategy implements ErrorStrategy {
  @override
  bool canHandle(DioException e) =>
      e.type == DioExceptionType.connectionTimeout;

  @override
  ApiErrorModel handle(DioException e) => ApiErrorModel(
    massege: 'Connection Timeout',
    statusCode: ApiLocalStatusCode.connectionTimeout,
    icon: Icons.timer_off,
  );
}

class SendTimeoutStrategy implements ErrorStrategy {
  @override
  bool canHandle(DioException e) => e.type == DioExceptionType.sendTimeout;

  @override
  ApiErrorModel handle(DioException e) => ApiErrorModel(
    massege: 'Send Timeout',
    statusCode: ApiLocalStatusCode.sendTimeout,
    icon: Icons.more_time,
  );
}

class ReceiveTimeoutStrategy implements ErrorStrategy {
  @override
  bool canHandle(DioException e) => e.type == DioExceptionType.receiveTimeout;

  @override
  ApiErrorModel handle(DioException e) => ApiErrorModel(
    massege: 'Receive Timeout',
    statusCode: ApiLocalStatusCode.receiveTimeout,
    icon: Icons.hourglass_bottom,
  );
}

class BadResponseStrategy implements ErrorStrategy {
  @override
  bool canHandle(DioException e) => e.type == DioExceptionType.badResponse;

  @override
  ApiErrorModel handle(DioException e) => ApiErrorModel(
    massege: 'Server Error ${ApiLocalStatusCode.badResponse}',
    statusCode: e.response?.statusCode ?? 26,
    icon: Icons.cloud_off,
  );
}

class UnknownErrorStrategy implements ErrorStrategy {
  @override
  bool canHandle(DioException e) => e.type == DioExceptionType.unknown;

  @override
  ApiErrorModel handle(DioException e) => ApiErrorModel(
    massege: 'Unknown Error',
    statusCode: ApiLocalStatusCode.unknownError,
    icon: Icons.error_outline,
  );
}
