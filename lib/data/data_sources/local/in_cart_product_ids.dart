import 'package:isar/isar.dart';

part 'in_cart_product_ids.g.dart';

@collection
class InCartProductID {
  Id id = Isar.autoIncrement;
  final int productID;

  InCartProductID(this.productID);
}
