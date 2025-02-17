import 'package:dartz/dartz.dart';
import 'package:my_app/core/failures.dart';
import 'package:my_app/features/main_user_screen/data/data_sources/product_remote_data_source.dart';
import 'package:my_app/features/main_user_screen/domain/entities/product.dart';
import 'package:my_app/features/main_user_screen/domain/repositories/product_repository.dart';

class ProductRepositoryImplementation implements ProductRepository {
  ProductRepositoryImplementation({required this.productRemoteDataSource});

  final ProductRemoteDataSource productRemoteDataSource;

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final products = await productRemoteDataSource.getProducts();
      return Right(products);
    } catch (e) {
      return Left(Failure('Failed to fetch products'));
    }
  }
}
