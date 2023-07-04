import 'package:dartz/dartz.dart';
import 'package:task_tarek/features/products/domain/entities/products_entity.dart';
import '../../../../core/error/faluires.dart';

abstract class ProductsDomainRepo {
  Future<Either<Failure, ProductsEntity>> getProducts();
}
