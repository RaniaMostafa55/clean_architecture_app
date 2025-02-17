import 'package:dartz/dartz.dart';
import 'package:my_app/core/failures.dart';
import 'package:my_app/features/main_user_screen/domain/entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts();
}
