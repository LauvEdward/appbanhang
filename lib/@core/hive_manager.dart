import 'package:appbanhang/model/product_hive.dart';
import 'package:appbanhang/screen/home/model/prduct.dart';
import 'package:hive/hive.dart';

class HiveService {
  static final share = HiveService();
  addBoxes(ProductHive item) async {
    print("adding boxes");
    final openBox = Hive.box("Cart");
    ProductHive? listPro = openBox.get(item.id);
    if (listPro == null) {
      print("Add sp moi");
      openBox.put(item.id, item);
    } else {
      print("Add sp ton tai");
      // listPro.soluong == null ? 0 : (listPro.soluong! + 1);
      var proUpdate = ProductHive()
        ..id = listPro.id
        ..name = listPro.name
        ..image = listPro.image
        ..price = listPro.price
        ..priceSale = listPro.priceSale
        ..soluong = ((listPro.soluong ?? 0) + 1)
        ..prodir = listPro.prodir;
      openBox.put(item.id, proUpdate);
    }
    // openBox.add(item);
  }

  removeSoluong(String id) {
    final openBox = Hive.box("Cart");
    ProductHive? listPro = openBox.get(id);
    if (listPro != null) {
      var proUpdate = ProductHive()
        ..id = listPro.id
        ..name = listPro.name
        ..image = listPro.image
        ..price = listPro.price
        ..priceSale = listPro.priceSale
        ..soluong = ((listPro.soluong ?? 0) - 1)
        ..prodir = listPro.prodir;
      openBox.put(id, proUpdate);
    }
  }

  removeItem(String id) {
    final openBox = Hive.box("Cart");
    openBox.delete(id);
  }

  Future<List<ProductHive>> getAllVlaue() async {
    final box = await Hive.openBox('Cart');
    box.clear();
    List<ProductHive> userList = box.values as List<ProductHive>;
    await box.close();
    return userList;
  }

  addSeenBoxes(ProductHive item) async {
    print("adding boxes");
    final openBox = Hive.box("Seen");
    ProductHive? listPro = openBox.get(item.id);
    if (listPro == null) {
      print("Add sp moi");
      openBox.put(item.id, item);
    }
  }

  Future<List<ProductHive>> getListlSeen() async {
    final box = await Hive.openBox('Seen');
    box.clear();
    List<ProductHive> userList = box.values as List<ProductHive>;
    await box.close();
    return userList;
  }
}
