import 'package:api/cubit/product_cubit.dart';
import 'package:api/net_work/apiLocalStatusCode.dart';
import 'package:api/net_work/api_error_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, required this.error});
  final ApiErrorModel error;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Center(
        child: Column(
          children: [
            Icon(error.icon, size: 200, color: Colors.red),
            Text(
              error.massege,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              error.statusCode.toString(),
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Visibility(
              visible: error.statusCode == ApiLocalStatusCode.connectionTimeout,
              child: TextButton(
                onPressed: () =>
                    BlocProvider.of<ProductCubit>(context).getProducts(),
                child: Text("reLoade"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
