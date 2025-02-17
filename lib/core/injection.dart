import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:my_app/features/main_user_screen/data/data_sources/product_remote_data_source.dart';
import 'package:my_app/features/main_user_screen/data/repositories/product_repository_implementation.dart';
import 'package:my_app/features/main_user_screen/domain/repositories/product_repository.dart';
import 'package:my_app/features/main_user_screen/domain/usecases/get_products.dart';
import 'package:my_app/features/main_user_screen/presentation/cubit/product_cubit.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<Dio>(
    Dio.new,
  );

  getIt.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImplementation(getIt<Dio>()),
  );

  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImplementation(
      productRemoteDataSource: getIt<ProductRemoteDataSource>(),
    ),
  );

  getIt.registerLazySingleton<GetProductsUseCase>(
    () => GetProductsUseCase(
      repository: getIt<ProductRepository>(),
    ),
  );

  getIt.registerFactory(
    () => ProductCubit(getProductsUseCase: getIt<GetProductsUseCase>()),
  );
}
