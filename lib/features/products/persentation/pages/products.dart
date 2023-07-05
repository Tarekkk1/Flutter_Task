import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/data_sources/remote_data_source.dart' show RemoteDataSource;
import 'package:task_tarek/features/products/persentation/manger/cubit.dart';

import '../manger/states.dart';
import '../widgets/product_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        RemoteDataSource remoteDataSource = RemoteDataSource();

        return ProductsCubit(remoteDataSource);
      },
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
          if (state is! ProductsManagerLoaded) {
            ProductsCubit.get(context).getProducts();
          }
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              leading: Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Transform.scale(
                  scale: 1.9,
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            body: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 348.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: const Color(0xB2FFFFFF),
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(
                          width: 1.0,
                          color: const Color(0xFF004182),
                        ),
                      ),
                      child: const TextField(
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          hintText: "What do you search for?",
                          contentPadding: EdgeInsets.only(left: 10),
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            color: Color(0xFF004182),
                            fontWeight: FontWeight.w500,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xFF004182),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        color: Color(0xFF004182),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                if (state is ProductsManagerLoaded)
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: state.productsEntity.products!.length,
                      itemBuilder: (context, index) {
                        final product = state.productsEntity.products![index];
                        return buildProductWidget(product);
                      },
                    ),
                  ),
                if (state is ProductsManagerLoading)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
