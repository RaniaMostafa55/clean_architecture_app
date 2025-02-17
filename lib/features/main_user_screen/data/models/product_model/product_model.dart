import 'package:my_app/features/main_user_screen/domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.title,
    required super.price,
    required super.description,
    required super.category,
    required super.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] as int,
        title: json['title'] as String,
        price: (json['price'] as num).toDouble(),
        description: json['description'] as String,
        category: json['category'] as String,
        image: json['image'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'description': description,
        'category': category,
        'image': image,
      };
}
