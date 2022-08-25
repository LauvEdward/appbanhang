import 'package:appbanhang/screen/home/model/prduct.dart';
import 'package:hive/hive.dart';
part 'product_hive.g.dart';

@HiveType(typeId: 0)
class ProductHive {
  @HiveField(0)
  String? id;
  @HiveField(1)
  Null? style;
  @HiveField(2)
  Null? idValue;
  @HiveField(3)
  String? brand;
  @HiveField(4)
  String? name;
  @HiveField(5)
  String? code;
  @HiveField(6)
  String? image;
  @HiveField(7)
  String? hot;
  @HiveField(8)
  String? home;
  @HiveField(9)
  String? focus;
  @HiveField(10)
  String? coupon;
  @HiveField(11)
  String? view;
  @HiveField(12)
  String? active;
  @HiveField(13)
  String? price;
  @HiveField(14)
  String? priceSale;
  @HiveField(15)
  String? description;
  @HiveField(16)
  Null? location;
  @HiveField(17)
  String? like;
  @HiveField(18)
  String? order;
  @HiveField(19)
  String? categoryId;
  @HiveField(20)
  Null? caption1;
  @HiveField(21)
  Null? caption2;
  @HiveField(22)
  String? locale;
  @HiveField(23)
  Null? bought;
  @HiveField(24)
  Null? dksudung;
  @HiveField(25)
  String? sort;
  @HiveField(26)
  String? quantity;
  @HiveField(27)
  Null? counter;
  @HiveField(28)
  String? lang;
  @HiveField(29)
  Null? destination;
  @HiveField(30)
  String? contents;
  @HiveField(31)
  String? time;
  @HiveField(32)
  Null? tags;
  @HiveField(33)
  dynamic proDir;
  @HiveField(34)
  Null? multiImage;
  @HiveField(35)
  Null? imgDir;
  @HiveField(36)
  String? status;
  @HiveField(37)
  Null? quaranty;
  @HiveField(38)
  Null? tinhtrang;
  @HiveField(39)
  Null? groupAttributeId;
  @HiveField(40)
  Null? color;
  @HiveField(41)
  Null? size;
  @HiveField(42)
  String? userId;
  @HiveField(43)
  Null? optionId;
  @HiveField(44)
  String? buttonColor1;
  @HiveField(45)
  String? configProContent;
  @HiveField(46)
  Null? weight;
  @HiveField(47)
  Null? priceImp;
  @HiveField(48)
  String? timeUpdate;
  @HiveField(49)
  String? combo;
  @HiveField(50)
  String? productDvtId;
}
