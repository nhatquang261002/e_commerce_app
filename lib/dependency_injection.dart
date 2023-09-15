import 'package:dio/dio.dart';
import 'package:e_commerce_app/data/data_sources/local/isar_db.dart';
import 'package:e_commerce_app/domain/usecases/add_favourite.dart';
import 'package:e_commerce_app/domain/usecases/add_to_cart.dart';
import 'package:e_commerce_app/domain/usecases/delete_from_cart.dart';
import 'package:e_commerce_app/domain/usecases/delete_from_favourite.dart';
import 'package:e_commerce_app/domain/usecases/get_all_favourite_products.dart';
import 'package:e_commerce_app/domain/usecases/get_all_in_cart_products.dart';
import 'package:e_commerce_app/domain/usecases/get_single_product.dart';
import 'package:e_commerce_app/domain/usecases/get_user.dart';
import 'package:e_commerce_app/domain/usecases/login.dart';
import 'package:e_commerce_app/domain/usecases/logout.dart';
import 'package:e_commerce_app/domain/usecases/reduce_in_cart.dart';
import 'package:e_commerce_app/domain/usecases/save_user.dart';
import 'package:e_commerce_app/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:get_it/get_it.dart';
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

  // Dependencies
  getIt.registerSingleton<FakeStoreApi>(FakeStoreApi());
  getIt.registerSingleton<IsarDatabase>(IsarDatabase());
  getIt.registerSingleton<StoreRepository>(
      StoreRepositoryImpl(api: getIt(), isar: getIt()));

  // UseCase
  getIt.registerSingleton<GetAllProductsUseCase>(
      GetAllProductsUseCase(repository: getIt()));
  getIt.registerSingleton<GetAllCategoriesUseCase>(
      GetAllCategoriesUseCase(repository: getIt()));
  getIt.registerSingleton<GetSpecificCategoryUseCase>(
      GetSpecificCategoryUseCase(repository: getIt()));
  getIt.registerSingleton<GetAllFavouriteProductsUseCase>(
      GetAllFavouriteProductsUseCase(repository: getIt()));
  getIt.registerSingleton<SaveFavouriteProductUseCase>(
      SaveFavouriteProductUseCase(repository: getIt()));
  getIt.registerSingleton<DeleteFavProductUseCase>(
      DeleteFavProductUseCase(repository: getIt()));
  getIt.registerSingleton<GetAllCartProductsUseCase>(
      GetAllCartProductsUseCase(repository: getIt()));
  getIt.registerSingleton<SaveInCartProductUseCase>(
      SaveInCartProductUseCase(repository: getIt()));
  getIt.registerSingleton<ReduceInCartUseCase>(
      ReduceInCartUseCase(storeRepository: getIt()));
  getIt.registerSingleton<DeleteInCartProductUseCase>(
      DeleteInCartProductUseCase(repository: getIt()));
  getIt.registerSingleton<GetSingleProductUseCase>(
      GetSingleProductUseCase(repository: getIt()));
  getIt.registerSingleton<SaveUserUserCase>(
      SaveUserUserCase(repository: getIt()));
  getIt.registerSingleton<GetUserUsecase>(GetUserUsecase(repository: getIt()));
  getIt.registerSingleton<LoginUseCase>(const LoginUseCase());
  getIt.registerSingleton(const LogoutUseCase());

  // Bloc
  getIt.registerSingleton<NetworkProductsBloc>(NetworkProductsBloc(
      getSingleProductUseCase: getIt(),
      getAllProducts: getIt(),
      getAllCategories: getIt(),
      getSpecificCategory: getIt()));
  getIt.registerSingleton<CartBloc>(CartBloc(
    getAllCartProductsUseCase: getIt(),
    saveInCartProductUseCase: getIt(),
    deleteInCartProductUseCase: getIt(),
    reduceInCartUseCase: getIt(),
  ));
  getIt.registerSingleton<FavouriteBloc>(FavouriteBloc(
      saveFavouriteProductUseCase: getIt(),
      getAllFavouriteProductsUseCase: getIt(),
      deleteFavProductUseCase: getIt()));
  getIt.registerSingleton<UserBloc>(UserBloc(
      saveUserUserCase: getIt(),
      getUserUsecase: getIt(),
      loginUseCase: getIt(),
      logoutUseCase: getIt()));
}
