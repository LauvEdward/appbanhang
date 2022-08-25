import 'package:appbanhang/screen/home/model/prduct.dart';
import 'package:hive/hive.dart';

class HiveService {
  static final share = HiveService();
  static String id = "id";
  isExists() async {
    final openBox = await Hive.openBox("Cart");
    int length = openBox.length;
    return length != 0;
  }

  addBoxes<T>(T item) async {
    print("adding boxes");
    final openBox = await Hive.openBox("Cart");

    openBox.add(item);
  }

  getBoxes<T>() async {
    List<T> boxList = <T>[];

    final openBox = await Hive.openBox("Cart");

    int length = openBox.length;

    for (int i = 0; i < length; i++) {
      boxList.add(openBox.getAt(i));
    }

    return boxList;
  }
}
