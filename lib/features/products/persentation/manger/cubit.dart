import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_tarek/features/products/data/repositeries/products_data_repo.dart';
import 'package:task_tarek/features/products/domain/repositories/products_domain_repo.dart';
import 'package:task_tarek/features/products/domain/use_cases/products_use_case.dart';
import 'package:task_tarek/features/products/persentation/manger/states.dart';

import '../../data/data_sources/products_data_sources.dart';

class ProductsCubit extends Cubit<ProductsManagerState> {
  ProductsDataSources productsDataSources;
  ProductsCubit(this.productsDataSources) : super(ProductsManagerInitial());

  static ProductsCubit get(context) => BlocProvider.of(context);

  void getProducts() async {
    print("get products");

    emit(ProductsManagerLoading());
    ProductsDomainRepo productsDomainRepo =
        ProductsDataRepo(productsDataSources: productsDataSources);
    ProducsUseCase producsUseCase =
        ProducsUseCase(productsDomainRepo: productsDomainRepo);
    var result = await producsUseCase.call();

    result.fold((l) {
      emit(ProductsManagerError(message: l));
    }, (r) {
      emit(ProductsManagerLoaded(productsEntity: r));
    });
  }
}
