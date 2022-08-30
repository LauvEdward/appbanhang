import 'package:appbanhang/screen/home/model/prduct.dart';
import 'package:hive/hive.dart';
part 'product_hive.g.dart';

@HiveType(typeId: 0)
class ProductHive {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? image;
  @HiveField(3)
  String? price;
  @HiveField(4)
  String? priceSale;
  @HiveField(5)
  int? soluong;
  @HiveField(6)
  String? prodir;
}
