import 'package:api/data/poductRepo.dart';
import 'package:api/model/productModel.dart';
import 'package:api/net_work/api_error_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({required this.repo}) : super(ProductInitial());
  final ProductRepo repo;

  getProducts() async {
    emit(ProductLoading());
    final data = await repo.getProduct();
    data.fold(
      (e) {
        emit(ProductError(e));
      },
      (data) {
        emit(ProductLoaded(data));
      },
    );
  }
}
