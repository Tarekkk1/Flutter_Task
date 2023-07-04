import 'package:dartz/dartz.dart';
import 'package:task_tarek/features/products/domain/entities/products_entity.dart';
import 'package:task_tarek/features/products/domain/repositories/products_domain_repo.dart';

import '../../../../core/error/faluires.dart';

class ProducsUseCase {
  ProductsDomainRepo productsDomainRepo;
  ProducsUseCase({required this.productsDomainRepo});
  Future<Either<Failure, ProductsEntity>> call() =>
      productsDomainRepo.getProducts();
}
