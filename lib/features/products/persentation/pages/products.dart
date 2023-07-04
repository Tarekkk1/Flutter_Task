import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_tarek/features/products/data/data_sources/remote_data_source.dart';
import 'package:task_tarek/features/products/persentation/manger/cubit.dart';

import '../manger/states.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(RemoteDataSource()),
      child: BlocConsumer<ProductsCubit, ProductsManagerState>(
        listener: (context, state) {
          if (state is ProductsManagerError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("error in get products ${state.message}"),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(title: const Text("App")),
              body: Column(
                children: [
                  TextButton(
                      onPressed: () {
                        ProductsCubit.get(context).getProducts();
                        if (state is ProductsManagerLoaded) {
                          var products = state.productsEntity.products;
                          if (products != null) {
                            for (var product in products) {
                              print(product.id);
                            }
                          }
                        }
                      },
                      child: Text("get products"))
                ],
              ));
        },
      ),
    );
  }
}
