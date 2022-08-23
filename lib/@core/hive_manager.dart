import 'package:hive/hive.dart';

class HiveManager {
  static final share = HiveManager();
  static final box = Hive.box("mycart");
}

@HiveType(typeId: 0)
class Person extends HiveObject {
  String? id;
  Null? style;
  Null? idValue;
  String? brand;
  String? name;
  String? code;
  String? image;
  String? hot;
  String? home;
  String? focus;
  String? coupon;
  String? view;
  String? active;
  String? price;
  String? priceSale;
  String? description;
  Null? location;
  String? like;
  String? order;
  String? categoryId;
  Null? caption1;
  Null? caption2;
  String? locale;
  Null? bought;
  Null? dksudung;
  String? sort;
  String? quantity;
  Null? counter;
  String? lang;
  Null? destination;
  String? contents;
  String? time;
  Null? tags;
  dynamic proDir;
  Null? multiImage;
  Null? imgDir;
  String? status;
  Null? quaranty;
  Null? tinhtrang;
  Null? groupAttributeId;
  Null? color;
  Null? size;
  String? userId;
  Null? optionId;
  String? buttonColor1;
  String? configProContent;
  Null? weight;
  Null? priceImp;
  String? timeUpdate;
  String? combo;
  String? productDvtId;
}
