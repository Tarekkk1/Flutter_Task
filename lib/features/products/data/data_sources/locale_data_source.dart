// ignore: file_names
import 'package:dartz/dartz.dart';
import 'package:task_tarek/core/error/faluires.dart';
import 'package:task_tarek/features/products/data/data_sources/products_data_sources.dart';
import 'package:task_tarek/features/products/data/models/products_model.dart';

class LocalDataSource implements ProductsDataSources {
  @override
  Future<Either<Failure, ProductsEntityModel>> getProducts() {
    throw UnimplementedError();
  }
}
