import 'package:bloc/bloc.dart';
import 'package:my_app/features/main_user_screen/domain/usecases/get_products.dart';
import 'package:my_app/features/main_user_screen/presentation/cubit/product_states.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({required this.getProductsUseCase}) : super(ProductInitial());
  final GetProductsUseCase getProductsUseCase;
  Future<void> fetchProducts() async {
    emit(ProductLoading());
    final result = await getProductsUseCase();
    result.fold(
      (failure) => emit(ProductError(failure.message)),
      (products) => emit(ProductLoaded(products)),
    );
  }
}
