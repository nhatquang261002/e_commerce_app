import 'package:isar/isar.dart';

part 'favourite_product_ids.g.dart';

@collection
class FavouriteProductID {
  Id id = Isar.autoIncrement;
  final int productID;

  FavouriteProductID(this.productID);
}
