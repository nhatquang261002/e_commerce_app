import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:e_commerce_app/data/data_sources/network/fake_store_api.dart';
import 'package:e_commerce_app/data/repository/store_repository_impl.dart';
import 'package:e_commerce_app/domain/repository/store_repository.dart';
import 'package:e_commerce_app/domain/usecases/get_all_categories.dart';
import 'package:e_commerce_app/domain/usecases/get_all_products.dart';
import 'package:e_commerce_app/domain/usecases/get_specific_category.dart';
import 'package:e_commerce_app/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:e_commerce_app/presentation/bloc/favourite_bloc/favourite_bloc.dart';
import 'package:e_commerce_app/presentation/bloc/network_products_bloc/network_products_bloc.dart';

GetIt getIt = GetIt.instance;

void initializeDependencies() async {
  // Dio
  getIt.registerSingleton<Dio>(Dio());

  // Isar

  // Dependencies
  getIt.registerSingleton<FakeStoreApi>(FakeStoreApi());
  getIt.registerSingleton<StoreRepository>(StoreRepositoryImpl(api: getIt()));

  // UseCase
  getIt.registerSingleton<GetAllProductsUseCase>(
      GetAllProductsUseCase(repository: getIt()));
  getIt.registerSingleton<GetAllCategoriesUseCase>(
      GetAllCategoriesUseCase(repository: getIt()));
  getIt.registerSingleton<GetSpecificCategoryUseCase>(
      GetSpecificCategoryUseCase(repository: getIt()));

  // Bloc
  getIt.registerSingleton<NetworkProductsBloc>(NetworkProductsBloc(
      getAllProducts: getIt(),
      getAllCategories: getIt(),
      getSpecificCategory: getIt()));
  getIt.registerSingleton<CartBloc>(CartBloc());
  getIt.registerSingleton<FavouriteBloc>(FavouriteBloc());
}
