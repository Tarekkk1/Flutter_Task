import 'package:equatable/equatable.dart';

class ProductsEntity extends Equatable {
  final List<Products>? products;

  const ProductsEntity({
    required this.products,
  });

  @override
  List<Object?> get props => [products];
}

class Products extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final int? price;
  final int? discountPercentage;
  final String? thumbnail;
  // ignore: prefer_typing_uninitialized_variables
  final rating;

  // final String? thumbnail;

  const Products(
      {required this.id,
      this.title,
      this.description,
      this.price,
      this.discountPercentage,
      this.rating,
      this.thumbnail});

  @override
  List<Object?> get props =>
      [id, title, description, price, discountPercentage, rating];
}
