import 'package:dartz/dartz.dart';
import 'package:my_app/core/failures.dart';
import 'package:my_app/features/main_user_screen/domain/entities/product.dart';
import 'package:my_app/features/main_user_screen/domain/repositories/product_repository.dart';

class GetProductsUseCase {
  GetProductsUseCase({required this.repository});

  final ProductRepository repository;

  Future<Either<Failure, List<Product>>> call() async {
    return repository.getProducts();
  }
}
