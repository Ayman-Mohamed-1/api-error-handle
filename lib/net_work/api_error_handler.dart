// import 'package:api/net_work/api_error_model.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';

// class ApiErrorHandler {
//   static ApiErrorModel handler(e) {
//     if (e is Exception) {
//       if (e is DioException) {
//         // 1️⃣ Connection Error
//         if (e.type == DioExceptionType.connectionError) {
//           return ApiErrorModel(
//             massege: 'Connection Error',
//             statesCode: 20,
//             icon: Icons.wifi_off,
//           );
//         }

//         // 2️⃣ Bad Certificate
//         if (e.type == DioExceptionType.badCertificate) {
//           return ApiErrorModel(
//             massege: 'Bad Certificate',
//             statesCode: 21,
//             icon: Icons.error,
//           );
//         }

//         // 3️⃣ Cancelled Request
//         if (e.type == DioExceptionType.cancel) {
//           return ApiErrorModel(
//             massege: 'Request Cancelled',
//             statesCode: 22,
//             icon: Icons.cancel,
//           );
//         }

//         // 4️⃣ Connection Timeout
//         if (e.type == DioExceptionType.connectionTimeout) {
//           return ApiErrorModel(
//             massege: 'Connection Timeout',
//             statesCode: 23,
//             icon: Icons.timer_off,
//           );
//         }

//         // 5️⃣ Send Timeout
//         if (e.type == DioExceptionType.sendTimeout) {
//           return ApiErrorModel(
//             massege: 'Send Timeout',
//             statesCode: 24,
//             icon: Icons.more_time,
//           );
//         }

//         // 6️⃣ Receive Timeout
//         if (e.type == DioExceptionType.receiveTimeout) {
//           return ApiErrorModel(
//             massege: 'Receive Timeout',
//             statesCode: 25,
//             icon: Icons.hourglass_bottom,
//           );
//         }

//         // 7️⃣ Bad Response (Error from Server)
//         if (e.type == DioExceptionType.badResponse) {
//           return ApiErrorModel(
//             massege: 'Server Error ${e.response?.statusCode ?? ''}',
//             statesCode: e.response?.statusCode ?? 26,
//             icon: Icons.cloud_off,
//           );
//         }

//         // 8️⃣ Unknown Error
//         if (e.type == DioExceptionType.unknown) {
//           return ApiErrorModel(
//             massege: 'Unknown Error',
//             statesCode: 27,
//             icon: Icons.error_outline,
//           );
//         }
//       }

//       // لو الاستثناء مش من Dio
//       return ApiErrorModel(
//         massege: 'Unexpected Error',
//         statesCode: 28,
//         icon: Icons.warning_amber,
//       );
//     }

//     // لو مش Exception أصلاً
//     return ApiErrorModel(
//       massege: 'Unknown Failure',
//       statesCode: 29,
//       icon: Icons.error,
//     );
//   }
// }

import 'package:api/net_work/apiLocalStatusCode.dart';
import 'package:api/net_work/api_error_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'error_strategy.dart';
import 'strategies.dart';

class ApiErrorHandler {
  static final List<ErrorStrategy> _strategies = [
    ConnectionErrorStrategy(),
    BadCertificateStrategy(),
    CancelErrorStrategy(),
    ConnectionTimeoutStrategy(),
    SendTimeoutStrategy(),
    ReceiveTimeoutStrategy(),
    BadResponseStrategy(),
    UnknownErrorStrategy(),
  ];

  static ApiErrorModel handler(dynamic e) {
    if (e is DioException) {
      for (var strategy in _strategies) {
        if (strategy.canHandle(e)) {
          return strategy.handle(e);
        }
      }
    }

    return ApiErrorModel(
      massege: 'Unexpected Error',
      statusCode: ApiLocalStatusCode.unexpectedError,
      icon: Icons.warning_amber,
    );
  }
}
