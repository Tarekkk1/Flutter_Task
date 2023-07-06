import 'package:flutter_test/flutter_test.dart';
import 'package:task_tarek/features/products/data/data_sources/products_data_sources.dart';
import 'package:task_tarek/features/products/data/data_sources/remote_data_source.dart';
import 'package:task_tarek/features/products/data/repositeries/products_data_repo.dart';
import 'package:task_tarek/features/products/domain/repositories/products_domain_repo.dart';
import 'package:task_tarek/features/products/domain/use_cases/products_use_case.dart';

void main() {
  test('Get products from the api method test', () async {
    ProductsDataSources productsDataSources = RemoteDataSource();
    ProductsDomainRepo productsDomainRepo =
        ProductsDataRepo(productsDataSources: productsDataSources);
    ProducsUseCase producsUseCase =
        ProducsUseCase(productsDomainRepo: productsDomainRepo);
    var result = await producsUseCase.call();
    expect(result.isRight(), true);
  });
}
