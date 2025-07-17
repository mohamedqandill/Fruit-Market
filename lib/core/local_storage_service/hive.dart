import 'package:hive/hive.dart';

import '../../features/seller_details/presentation/widgets/seller_details_body_portirat.dart';

class HiveCart {
  static const String _boxName = 'productDetailsBox';

  static Future<void> addProduct(ProductDetails product) async {
    final box = await Hive.openBox<Map>(_boxName);
    await box.put(product.id, product.toMap());
  }

  static Future<List<ProductDetails>> getAllProducts() async {
    final box = await Hive.openBox<Map>(_boxName);
    return box.values
        .map((e) => ProductDetails.fromMap(Map<String, dynamic>.from(e)))
        .toList();
  }

  static Future<void> deleteProduct(int id) async {
    final box = await Hive.openBox<Map>(_boxName);
    await box.delete(id);
  }

  static Future<void> clearAll() async {
    final box = await Hive.openBox<Map>(_boxName);
    await box.clear();
  }

  static Future<void> increaseQuantity(int id) async {
    final box = await Hive.openBox<Map>(_boxName);
    var map = box.get(id);
    if (map != null) {
      var product = ProductDetails.fromMap(Map<String, dynamic>.from(map));
      product.quantity += 1;
      await box.put(id, product.toMap());
    }
  }

  static Future<void> decreaseQuantity(int id) async {
    final box = await Hive.openBox<Map>(_boxName);
    var map = box.get(id);
    if (map != null) {
      var product = ProductDetails.fromMap(Map<String, dynamic>.from(map));
      if (product.quantity > 1) {
        product.quantity -= 1;
        await box.put(id, product.toMap());
      }
    }
  }

  static Future<double> getTotalPrice() async {
    final box = await Hive.openBox<Map>(_boxName);
    double total = 0;
    for (var item in box.values) {
      var product = ProductDetails.fromMap(Map<String, dynamic>.from(item));
      double unitPrice = double.tryParse(product.priceAfterDiscount) ?? 0;
      total += product.quantity * unitPrice;
    }
    return total;
  }
}
