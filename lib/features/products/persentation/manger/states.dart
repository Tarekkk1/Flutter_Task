import '../../../../core/error/faluires.dart';
import '../../domain/entities/products_entity.dart';

abstract class ProductsManagerState {}

class ProductsManagerInitial extends ProductsManagerState {}

class ProductsManagerLoading extends ProductsManagerState {}

class ProductsManagerLoaded extends ProductsManagerState {
  final ProductsEntity productsEntity;

  ProductsManagerLoaded({required this.productsEntity});
}

class ProductsManagerError extends ProductsManagerState {
  final Failure message;

  ProductsManagerError({required this.message});
}
