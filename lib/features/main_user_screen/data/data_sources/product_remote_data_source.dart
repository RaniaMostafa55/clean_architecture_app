import 'package:dio/dio.dart';
import 'package:my_app/features/main_user_screen/data/models/product_model/product_model.dart';
import 'package:my_app/features/main_user_screen/domain/entities/product.dart';

abstract class ProductRemoteDataSource {
  Future<List<Product>> getProducts();
}

class ProductRemoteDataSourceImplementation implements ProductRemoteDataSource {
  ProductRemoteDataSourceImplementation(this.dio);
  final endPoint = 'https://fakestoreapi.com/products';
  final Dio? dio;
  @override
  Future<List<Product>> getProducts() async {
    try {
      final response = await dio!.get<List<dynamic>>(
        endPoint,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
      final products = (response.data!).map((e) {
        final product = e as Map<String, dynamic>;
        return product;
      }).toList();
      final productsList = products.map(ProductModel.fromJson).toList();
      return productsList;
    } catch (e) {
      throw Exception(e);
    }
  }
}
