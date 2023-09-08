import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';
import 'package:e_commerce_app/data/data_sources/local/favourite_product_ids.dart';
import 'package:e_commerce_app/data/data_sources/local/in_cart_product_ids.dart';

class IsarDatabase {
  late Future<Isar> isar;

  IsarDatabase() {
    isar = openIsar();
  }

  Future<Isar> openIsar() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationCacheDirectory();
      final isar = await Isar.open(
          [FavouriteProductIDSchema, InCartProductIDSchema],
          directory: dir.path);

      return isar;
    }

    return Isar.getInstance()!;
  }

  Future<void> saveFavouriteProduct(int productID) async {
    final db = await isar;
    final newFavProduct = FavouriteProductID(productID);
    db.writeTxnSync(() => db.favouriteProductIDs.put(newFavProduct));
  }

  Future<void> saveInCartProduct(int productID) async {
    final db = await isar;
    final newInCartProduct = InCartProductID(productID);
    db.writeTxnSync(() => db.inCartProductIDs.put(newInCartProduct));
  }

  Future<void> deleteFavouriteProduct(int productID) async {
    final db = await isar;
    db.writeTxnSync(() => db.favouriteProductIDs
        .filter()
        .productIDEqualTo(productID)
        .deleteAllSync());
  }

  Future<void> deleteInCartProduct(int productID) async {
    final db = await isar;
    db.writeTxnSync(() => db.inCartProductIDs
        .filter()
        .productIDEqualTo(productID)
        .deleteAllSync());
  }

  Future<List<FavouriteProductID>> getAllFavProdsID() async {
    final db = await isar;
    return await db.favouriteProductIDs.where().findAll();
  }

  Future<List<InCartProductID>> getAllInCartProdsID() async {
    final db = await isar;
    return await db.inCartProductIDs.where().findAll();
  }

  Stream<List<FavouriteProductID>> watchFavProductsID() async* {
    final db = await isar;
    yield* db.favouriteProductIDs.where().watch();
  }

  Stream<List<InCartProductID>> watchInCartProductsID() async* {
    final db = await isar;
    yield* db.inCartProductIDs.where().watch();
  }
}
