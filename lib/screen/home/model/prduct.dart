class Product {
  int? statusCode;
  List<DataProduct>? data;

  Product({this.statusCode, this.data});

  Product.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    if (json['data'] != null) {
      data = <DataProduct>[];
      json['data'].forEach((v) {
        data!.add(new DataProduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataProduct {
  String? id;
  Null? user;
  String? name;
  String? image;
  String? parentId;
  String? home;
  String? sort;
  String? hot;
  String? coupon;
  Null? focus;
  String? lang;
  Null? gender;
  String? banner;
  List<Pro>? pro;

  DataProduct(listProduct,
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

  DataProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    name = json['name'];
    image = json['image'];
    parentId = json['parent_id'];
    home = json['home'];
    sort = json['sort'];
    hot = json['hot'];
    coupon = json['coupon'];
    focus = json['focus'];
    lang = json['lang'];
    gender = json['gender'];
    banner = json['banner'];
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

class Pro {
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

  Pro(
      {this.id,
      this.style,
      this.idValue,
      this.brand,
      this.name,
      this.code,
      this.image,
      this.hot,
      this.home,
      this.focus,
      this.coupon,
      this.view,
      this.active,
      this.price,
      this.priceSale,
      this.description,
      this.location,
      this.like,
      this.order,
      this.categoryId,
      this.caption1,
      this.caption2,
      this.locale,
      this.bought,
      this.dksudung,
      this.sort,
      this.quantity,
      this.counter,
      this.lang,
      this.destination,
      this.contents,
      this.time,
      this.tags,
      this.proDir,
      this.multiImage,
      this.imgDir,
      this.status,
      this.quaranty,
      this.tinhtrang,
      this.groupAttributeId,
      this.color,
      this.size,
      this.userId,
      this.optionId,
      this.buttonColor1,
      this.configProContent,
      this.weight,
      this.priceImp,
      this.timeUpdate,
      this.combo,
      this.productDvtId});

  Pro.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    style = json['style'];
    idValue = json['id_value'];
    brand = json['brand'];
    name = json['name'];
    code = json['code'];
    image = json['image'];
    hot = json['hot'];
    home = json['home'];
    focus = json['focus'];
    coupon = json['coupon'];
    view = json['view'];
    active = json['active'];
    price = json['price'];
    priceSale = json['price_sale'];
    description = json['description'];
    location = json['location'];
    like = json['like'];
    order = json['order'];
    categoryId = json['category_id'];
    caption1 = json['caption_1'];
    caption2 = json['caption_2'];
    locale = json['locale'];
    bought = json['bought'];
    dksudung = json['dksudung'];
    sort = json['sort'];
    quantity = json['quantity'];
    counter = json['counter'];
    lang = json['lang'];
    destination = json['destination'];
    contents = json['contents'];
    time = json['time'];
    tags = json['tags'];
    proDir = json['pro_dir'] == null ? null : json['pro_dir'];
    multiImage = json['multi_image'];
    imgDir = json['img_dir'];
    status = json['status'];
    quaranty = json['quaranty'];
    tinhtrang = json['tinhtrang'];
    groupAttributeId = json['group_attribute_id'];
    color = json['color'];
    size = json['size'];
    userId = json['user_id'];
    optionId = json['option_id'];
    buttonColor1 = json['button_color1'];
    configProContent = json['config_pro_content'];
    weight = json['weight'];
    priceImp = json['price_imp'];
    timeUpdate = json['time_update'];
    combo = json['combo'];
    productDvtId = json['product_dvt_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['style'] = this.style;
    data['id_value'] = this.idValue;
    data['brand'] = this.brand;
    data['name'] = this.name;
    data['code'] = this.code;
    data['image'] = this.image;
    data['hot'] = this.hot;
    data['home'] = this.home;
    data['focus'] = this.focus;
    data['coupon'] = this.coupon;
    data['view'] = this.view;
    data['active'] = this.active;
    data['price'] = this.price;
    data['price_sale'] = this.priceSale;
    data['description'] = this.description;
    data['location'] = this.location;
    data['like'] = this.like;
    data['order'] = this.order;
    data['category_id'] = this.categoryId;
    data['caption_1'] = this.caption1;
    data['caption_2'] = this.caption2;
    data['locale'] = this.locale;
    data['bought'] = this.bought;
    data['dksudung'] = this.dksudung;
    data['sort'] = this.sort;
    data['quantity'] = this.quantity;
    data['counter'] = this.counter;
    data['lang'] = this.lang;
    data['destination'] = this.destination;
    data['contents'] = this.contents;
    data['time'] = this.time;
    data['tags'] = this.tags;
    data['pro_dir'] = this.proDir ?? "";
    data['multi_image'] = this.multiImage;
    data['img_dir'] = this.imgDir;
    data['status'] = this.status;
    data['quaranty'] = this.quaranty;
    data['tinhtrang'] = this.tinhtrang;
    data['group_attribute_id'] = this.groupAttributeId;
    data['color'] = this.color;
    data['size'] = this.size;
    data['user_id'] = this.userId;
    data['option_id'] = this.optionId;
    data['button_color1'] = this.buttonColor1;
    data['config_pro_content'] = this.configProContent;
    data['weight'] = this.weight;
    data['price_imp'] = this.priceImp;
    data['time_update'] = this.timeUpdate;
    data['combo'] = this.combo;
    data['product_dvt_id'] = this.productDvtId;
    return data;
  }
}
