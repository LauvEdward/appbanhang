import 'package:appbanhang/screen/home/model/prduct.dart';

class CategoryFilter {
  int? statusCode;
  CategoryFilterData? data;

  CategoryFilter({this.statusCode, this.data});

  CategoryFilter.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'] ?? "";
    data = json['data'] != null
        ? new CategoryFilterData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class CategoryFilterData {
  Category? category;

  CategoryFilterData({this.category});

  CategoryFilterData.fromJson(Map<String, dynamic> json) {
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class Category {
  String? id;
  Null? user;
  String? name;
  String? image;
  String? parentId;
  Null? home;
  String? sort;
  String? hot;
  String? coupon;
  Null? focus;
  String? lang;
  Null? gender;
  String? banner;
  List<ProCa>? pro;

  Category(
      {this.id,
      this.user,
      this.name,
      this.image,
      this.parentId,
      this.home,
      this.sort,
      this.hot,
      this.coupon,
      this.focus,
      this.lang,
      this.gender,
      this.banner,
      this.pro});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    user = json['user'] ?? "";
    name = json['name'] ?? "";
    image = json['image'] ?? "";
    parentId = json['parent_id'] ?? "";
    home = json['home'] ?? "";
    sort = json['sort'] ?? "";
    hot = json['hot'] ?? "";
    coupon = json['coupon'] ?? "";
    focus = json['focus'] ?? "";
    lang = json['lang'] ?? "";
    gender = json['gender'] ?? "";
    banner = json['banner'] ?? "";
    if (json['pro'] != null) {
      pro = <ProCa>[];
      json['pro'].forEach((v) {
        pro!.add(new ProCa.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['name'] = this.name;
    data['image'] = this.image;
    data['parent_id'] = this.parentId;
    data['home'] = this.home;
    data['sort'] = this.sort;
    data['hot'] = this.hot;
    data['coupon'] = this.coupon;
    data['focus'] = this.focus;
    data['lang'] = this.lang;
    data['gender'] = this.gender;
    data['banner'] = this.banner;
    if (this.pro != null) {
      data['pro'] = this.pro!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProCa {
  String? id;
  String? user;
  String? name;
  String? image;
  String? parentId;
  String? home;
  String? sort;
  String? hot;
  String? coupon;
  String? focus;
  String? lang;
  String? gender;
  String? banner;
  List<Pro>? pro;

  ProCa(
      {this.id,
      this.user,
      this.name,
      this.image,
      this.parentId,
      this.home,
      this.sort,
      this.hot,
      this.coupon,
      this.focus,
      this.lang,
      this.gender,
      this.banner,
      this.pro});

  ProCa.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    user = json['user'] ?? "";
    name = json['name'] ?? "";
    image = json['image'] ?? "";
    parentId = json['parent_id'] ?? "";
    home = json['home'] ?? "";
    sort = json['sort'] ?? "";
    hot = json['hot'] ?? "";
    coupon = json['coupon'] ?? "";
    focus = json['focus'] ?? "";
    lang = json['lang'] ?? "";
    gender = json['gender'] ?? "";
    banner = json['banner'] ?? "";
    if (json['pro'] != null) {
      pro = <Pro>[];
      json['pro'].forEach((v) {
        pro!.add(new Pro.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['name'] = this.name;
    data['image'] = this.image;
    data['parent_id'] = this.parentId;
    data['home'] = this.home;
    data['sort'] = this.sort;
    data['hot'] = this.hot;
    data['coupon'] = this.coupon;
    data['focus'] = this.focus;
    data['lang'] = this.lang;
    data['gender'] = this.gender;
    data['banner'] = this.banner;
    if (this.pro != null) {
      data['pro'] = this.pro!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
