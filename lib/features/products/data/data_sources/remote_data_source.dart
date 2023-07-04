import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task_tarek/core/error/faluires.dart';
import 'package:task_tarek/features/products/data/data_sources/products_data_sources.dart';
import 'package:task_tarek/features/products/data/models/products_model.dart';

import '../../../../core/apis/endpoints.dart';
import '../../../../core/utils/constants.dart';

class RemoteDataSource implements ProductsDataSources {
  Dio dio = Dio();
  @override
  Future<Either<Failure, ProductsEntityModel>> getProducts() async {
    try {
      var response =
          await dio.get("${AppConstants.baseApiUrl}${EndPoints.products}");

      ProductsEntityModel productsEntityModel =
          ProductsEntityModel.fromJson(response.data);
      return Right(productsEntityModel);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
