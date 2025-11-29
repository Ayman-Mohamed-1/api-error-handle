import 'package:api/screens/widget/error_Screen.dart';
import 'package:api/screens/widget/product_curd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/product_cubit.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          await BlocProvider.of<ProductCubit>(context).getProducts();
        },
        child: Scaffold(
          appBar: AppBar(title: const Text('Home'), centerTitle: true),
          body: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProductLoaded) {
                return GridView.builder(
                  controller: _controller,
                  itemCount: state.products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    // mainAxisExtent: 250,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    return ProductCart(productMap: state.products[index]);
                  },
                );
              } else if (state is ProductError) {
                return ErrorScreen(error: state.massege);
              }
              return const Center(child: Text('No products found'));
            },
          ),
        ),
      ),
    );
  }
}
