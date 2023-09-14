import 'package:e_commerce_app/data/models/product.dart';
import 'package:e_commerce_app/data/models/user.dart';
import 'package:e_commerce_app/domain/entities/product.dart';
import 'package:e_commerce_app/domain/entities/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';

class IsarDatabase {
  late Future<Isar> isar;

  IsarDatabase() {
    isar = openIsar();
  }

  Future<Isar> openIsar() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationCacheDirectory();
      final isar = await Isar.open([ProductEntitySchema, UserEntitySchema],
          directory: dir.path);

      return isar;
    }

    return Isar.getInstance()!;
  }

  Future<void> saveProduct(ProductModel product) async {
    final db = await isar;
    db.writeTxnSync(() => db.productEntitys.put(product));
  }

  Future<void> saveFavouriteProduct(ProductModel product) async {
    final db = await isar;

    db.writeTxnSync(() {
      product.isFavourite = true;
      db.productEntitys.putSync(product);
    });
  }

  Future<void> saveInCartProduct(ProductModel product) async {
    final db = await isar;

    db.writeTxnSync(() {
      if (db.productEntitys
          .where()
          .filter()
          .idEqualTo(product.id)
          .isNotEmptySync()) {
        product.quantityInCart = product.quantityInCart! + 1;
      } else {
        product.quantityInCart = 1;
      }
      db.productEntitys.putSync(product);
    });
  }

  Future<void> deleteFavouriteProduct(ProductModel product) async {
    final db = await isar;
    db.writeTxnSync(() {
      product.isFavourite = false;
      db.productEntitys.putSync(product);
      if (product.quantityInCart! <= 0 && product.isFavourite == false) {
        db.productEntitys.deleteSync(product.isarId);
      }
    });
  }

  Future<void> deleteInCartProduct(ProductModel product) async {
    final db = await isar;

    db.writeTxnSync(() {
      product.quantityInCart = 0;
      db.productEntitys.putSync(product);
      if (product.quantityInCart! <= 0 && product.isFavourite == false) {
        db.productEntitys.deleteSync(product.isarId);
      }
    });
  }

  Future<void> reduceInCart(ProductModel product) async {
    final db = await isar;

    db.writeTxnSync(() {
      product.quantityInCart = product.quantityInCart! - 1;
      db.productEntitys.putSync(product);
      if (product.quantityInCart! <= 0 && product.isFavourite == false) {
        db.productEntitys.deleteSync(product.isarId);
      }
    });
  }

  Future<List<ProductModel>> getAllFavProducts() async {
    final db = await isar;
    List<ProductModel> prods = [];
    List<ProductEntity> prodsEntity =
        await db.productEntitys.filter().isFavouriteEqualTo(true).findAll();
    for (var prod in prodsEntity) {
      ProductModel model = ProductModel(
        id: prod.id!,
        title: prod.title!,
        price: prod.price!,
        description: prod.description!,
        category: prod.category!,
        image: prod.image!,
        isFavourite: prod.isFavourite!,
        quantityInCart: prod.quantityInCart!,
      );
      prods.add(model);
    }

    return prods;
  }

  Future<List<ProductModel>> getAllInCartProducts() async {
    final db = await isar;
    List<ProductModel> prods = [];
    List<ProductEntity> prodsEntity =
        await db.productEntitys.filter().quantityInCartGreaterThan(0).findAll();
    for (var prod in prodsEntity) {
      ProductModel model = ProductModel(
        id: prod.id!,
        title: prod.title!,
        price: prod.price!,
        description: prod.description!,
        category: prod.category!,
        image: prod.image!,
        isFavourite: prod.isFavourite!,
        quantityInCart: prod.quantityInCart!,
      );
      prods.add(model);
    }

    return prods;
  }

  // Stream<List<ProductModel>> watchFavProductsID() async* {
  //   final db = await isar;
  //   yield* db.productEntitys.where().filter().isFavouriteEqualTo(true).watch()
  //       as Stream<List<ProductModel>>;
  // }

  // Stream<List<InCartProductID>> watchInCartProductsID() async* {
  //   final db = await isar;
  //   yield* db.inCartProductIDs.where().watch();
  // }

  Future<void> saveUser(UserModel user) async {
    final db = await isar;

    db.writeTxnSync(() => db.userEntitys.putSync(user));
  }

  Future<UserModel> readUser(String email) async {
    final db = await isar;
    UserEntity? entity =
        await db.userEntitys.where().filter().emailEqualTo(email).findFirst();
    UserModel user = UserModel(
      email: entity!.email,
      password: entity.password,
      firstName: entity.firstName,
      lastName: entity.lastName,
      phoneNumber: entity.phoneNumber,
      location: entity.firstName,
    );
    return user;
  }
}
