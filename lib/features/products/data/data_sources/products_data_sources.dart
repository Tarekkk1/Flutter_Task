import 'package:dartz/dartz.dart';
import 'package:task_tarek/features/products/data/models/products_model.dart';

import '../../../../core/error/faluires.dart';

abstract class ProductsDataSources {
  Future<Either<Failure, ProductsEntityModel>> getProducts();
}
