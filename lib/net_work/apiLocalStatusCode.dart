class ApiLocalStatusCode {
  /// * * * 🔴 Dio Exceptions (Start from 1000) * * *

  /// 📡 فشل الاتصال بالإنترنت
  static const int connectionError = 1000;

  /// 🔐 الشهادة الأمنية غير صالحة
  static const int badCertificate = 1001;

  /// ❌ تم إلغاء الطلب قبل التنفيذ
  static const int requestCancelled = 1002;

  /// ⏳ إنتهاء مهلة الاتصال قبل بدء الاتصال بالسيرفر
  static const int connectionTimeout = 1003;

  /// ⏱ انتهى الوقت قبل إرسال البيانات
  static const int sendTimeout = 1004;

  /// ⏱ انتهى الوقت قبل استقبال البيانات
  static const int receiveTimeout = 1005;

  /// ☁️ خطأ أو رد غير صحيح من السيرفر
  static const int badResponse = 1006;

  /// ❓ خطأ غير معروف
  static const int unknownError = 1007;

  /// ⚠️ خطأ غير متوقع من التطبيق
  static const int unexpectedError = 1008;
}