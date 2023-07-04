import 'package:dartz/dartz.dart';
import 'package:task_tarek/features/products/domain/repositories/products_domain_repo.dart';

import '../../../../core/error/faluires.dart';
import '../../domain/entities/products_entity.dart';
import '../data_sources/products_data_sources.dart';

class ProductsDataRepo extends ProductsDomainRepo {
  ProductsDataRepo({required this.productsDataSources});
  final ProductsDataSources productsDataSources;
  @override
  Future<Either<Failure, ProductsEntity>> getProducts() async {
    return await productsDataSources.getProducts();
  }
}
