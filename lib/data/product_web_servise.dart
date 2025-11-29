

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ProductWebService {
  final Dio _dio = Dio()..interceptors.add(PrettyDioLogger());

  Future<Response> getProductResponse() async {
    return await _dio.get('https://fakestoreapi.com/products');
  }
}
