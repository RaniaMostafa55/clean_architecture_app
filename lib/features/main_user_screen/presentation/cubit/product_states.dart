import 'package:my_app/features/main_user_screen/domain/entities/product.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  ProductLoaded(this.products);
  final List<Product> products;
}

class ProductError extends ProductState {
  ProductError(this.message);
  final String message;
}
