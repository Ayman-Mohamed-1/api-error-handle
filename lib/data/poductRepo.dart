import 'dart:developer';

import 'package:api/data/product_web_servise.dart';
import 'package:api/model/productModel.dart';
import 'package:api/net_work/api_error_handler.dart';
import 'package:api/net_work/api_error_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProductRepo {
  final ProductWebService servise;
  ProductRepo({required this.servise});

  Future<Either<ApiErrorModel, List<ProductModel>>> getProduct() async {
    try {
      final Response response = await servise.getProductResponse();
      final List data = response.data;
      final List<ProductModel> products = data
          .map((e) => ProductModel.fromJson(e))
          .toList();
      return right(products);
    } catch (e) {
      log(e.toString());
      return left(ApiErrorHandler.handler(e));
    }
  }
}
