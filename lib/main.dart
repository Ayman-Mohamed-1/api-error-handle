import 'package:api/cubit/product_cubit.dart';
import 'package:api/data/poductRepo.dart';
import 'package:api/data/product_web_servise.dart';
import 'package:api/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
  // ProductWebServise().getProductRespons();
  // ProductRepo(servise: ProductWebServise()).getProduct();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) =>
            ProductCubit(repo: ProductRepo(servise: ProductWebService()))
              ..getProducts(),
        child: HomeScreen(),
      ),
    );
  }
}
