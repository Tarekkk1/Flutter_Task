import 'package:task_tarek/features/products/domain/entities/products_entity.dart';

class ProductsEntityModel extends ProductsEntity {
  const ProductsEntityModel({required super.products});

  factory ProductsEntityModel.fromJson(Map<String, dynamic> json) {
    return ProductsEntityModel(
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ProductsModel extends Products {
  const ProductsModel({
    super.id,
    super.title,
    super.description,
    super.price,
    super.discountPercentage,
    super.rating,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        price: json['price'],
        discountPercentage: json['discount_percentage'],
        rating: json['rating']);
  }
}
