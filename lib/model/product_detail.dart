class ProductDetail {
  int? statusCode;
  ProductDetailData? data;

  ProductDetail({this.statusCode, this.data});

  ProductDetail.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    data = json['data'] != null
        ? new ProductDetailData.fromJson(json['data'])
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

class SizeS {
  String? id;
  String? priceSale;
  String? quantity;
  String? priceNiemYet;
  String? statusSize;
  String? name;

  SizeS(
      {this.id,
      this.priceSale,
      this.quantity,
      this.priceNiemYet,
      this.statusSize,
      this.name});

  SizeS.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    priceSale = json['priceSale'];
    quantity = json['quantity'];
    priceNiemYet = json['priceNiemYet'];
    statusSize = json['statusSize'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['priceSale'] = this.priceSale;
    data['quantity'] = this.quantity;
    data['priceNiemYet'] = this.priceNiemYet;
    data['statusSize'] = this.statusSize;
    data['name'] = this.name;
    return data;
  }
}

class ProductDetailData {
  Item? item;
  ProductDvt? productDvt;
  List<Comments>? comments;
  List<Thuoctinh>? thuoctinh;
  CateCurrent? cateCurrent;
  List<String>? tag;
  List<SizeS>? sizeS;
  List<SizeSType>? sizeSType;
  List<String>? color;
  List<PImages>? pImages;

  ProductDetailData(
      {this.item,
      this.productDvt,
      this.comments,
      this.thuoctinh,
      this.cateCurrent,
      this.tag,
      this.sizeS,
      this.sizeSType,
      this.color,
      this.pImages});

  ProductDetailData.fromJson(Map<String, dynamic> json) {
    item = json['item'] != null ? new Item.fromJson(json['item']) : null;
    productDvt = json['product_dvt'] != null
        ? new ProductDvt.fromJson(json['product_dvt'])
        : null;
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    } else {
      comments = null;
    }
    if (json['thuoctinh'] != null) {
      thuoctinh = <Thuoctinh>[];
      json['thuoctinh'].forEach((v) {
        thuoctinh!.add(new Thuoctinh.fromJson(v));
      });
    } else {
      thuoctinh = null;
    }
    cateCurrent = json['cate_current'] != null
        ? new CateCurrent.fromJson(json['cate_current'])
        : null;
    if (json['tag'] != null) {
      tag = <String>[];
      json['tag'].forEach((v) {
        tag!.add(v);
      });
    } else {
      tag = null;
    }
    if (json['size_s'] != null) {
      sizeS = <SizeS>[];
      json['size_s'].forEach((v) {
        sizeS!.add(new SizeS.fromJson(v));
      });
    } else {
      sizeS = null;
    }
    if (json['size_s_type'] != null) {
      sizeSType = <SizeSType>[];
      json['size_s_type'].forEach((v) {
        sizeSType!.add(new SizeSType.fromJson(v));
      });
    } else {
      sizeSType = null;
    }
    if (json['color'] != null) {
      color = <String>[];
      json['color'].forEach((v) {
        color!.add(v);
      });
    } else {
      color = null;
    }
    if (json['p_images'] != null) {
      pImages = <PImages>[];
      json['p_images'].forEach((v) {
        pImages!.add(new PImages.fromJson(v));
      });
    } else {
      pImages = null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.item != null) {
      data['item'] = this.item!.toJson();
    }
    if (this.productDvt != null) {
      data['product_dvt'] = this.productDvt!.toJson();
    }
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    if (this.thuoctinh != null) {
      data['thuoctinh'] = this.thuoctinh!.map((v) => v.toJson()).toList();
    }
    if (this.cateCurrent != null) {
      data['cate_current'] = this.cateCurrent!.toJson();
    }
    if (this.tag != null) {
      data['tag'] = this.tag!.map((v) => v).toList();
    }
    if (this.sizeS != null) {
      data['size_s'] = this.sizeS!.map((v) => v).toList();
    }
    if (this.sizeSType != null) {
      data['size_s_type'] = this.sizeSType!.map((v) => v.toJson()).toList();
    }
    if (this.color != null) {
      data['color'] = this.color!.map((v) => v).toList();
    }
    if (this.pImages != null) {
      data['p_images'] = this.pImages!.map((v) => v).toList();
    }
    return data;
  }
}

class Item {
  String? id;
  String? style;
  String? idValue;
  String? brand;
  String? name;
  String? code;
  String? alias;
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
  String? descriptionSeo;
  String? location;
  String? titleSeo;
  String? keywordSeo;
  String? detail;
  String? note;
  String? like;
  String? order;
  String? categoryId;
  String? caption1;
  String? caption2;
  String? locale;
  String? bought;
  String? dksudung;
  String? sort;
  String? quantity;
  String? counter;
  String? lang;
  String? destination;
  String? contents;
  String? time;
  String? tags;
  String? proDir;
  String? multiImage;
  String? imgDir;
  String? status;
  String? quaranty;
  String? tinhtrang;
  String? groupAttributeId;
  String? color;
  String? size;
  String? userId;
  String? optionId;
  String? buttonColor1;
  List<ConfigPro>? configPro;
  String? configProContent;
  String? weight;
  String? priceImp;
  String? timeUpdate;
  String? combo;
  String? productDvtId;
  String? thongso;
  String? thanhphan;
  String? huongdan;

  Item(
      {this.id,
      this.style,
      this.idValue,
      this.brand,
      this.name,
      this.code,
      this.alias,
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
      this.descriptionSeo,
      this.location,
      this.titleSeo,
      this.keywordSeo,
      this.detail,
      this.note,
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
      this.configPro,
      this.configProContent,
      this.weight,
      this.priceImp,
      this.timeUpdate,
      this.combo,
      this.productDvtId,
      this.thongso,
      this.thanhphan,
      this.huongdan});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    style = json['style'];
    idValue = json['id_value'];
    brand = json['brand'];
    name = json['name'];
    code = json['code'];
    alias = json['alias'];
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
    descriptionSeo = json['description_seo'];
    location = json['location'];
    titleSeo = json['title_seo'];
    keywordSeo = json['keyword_seo'];
    detail = json['detail'];
    note = json['note'];
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
    proDir = json['pro_dir'];
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
    if (json['config_pro'] != null) {
      configPro = <ConfigPro>[];
      json['config_pro'].forEach((v) {
        configPro!.add(new ConfigPro.fromJson(v));
      });
    }
    configProContent = json['config_pro_content'];
    weight = json['weight'];
    priceImp = json['price_imp'];
    timeUpdate = json['time_update'];
    combo = json['combo'];
    productDvtId = json['product_dvt_id'];
    thongso = json['thongso'];
    thanhphan = json['thanhphan'];
    huongdan = json['huongdan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['style'] = this.style;
    data['id_value'] = this.idValue;
    data['brand'] = this.brand;
    data['name'] = this.name;
    data['code'] = this.code;
    data['alias'] = this.alias;
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
    data['description_seo'] = this.descriptionSeo;
    data['location'] = this.location;
    data['title_seo'] = this.titleSeo;
    data['keyword_seo'] = this.keywordSeo;
    data['detail'] = this.detail;
    data['note'] = this.note;
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
    data['pro_dir'] = this.proDir;
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
    if (this.configPro != null) {
      data['config_pro'] = this.configPro!.map((v) => v.toJson()).toList();
    }
    data['config_pro_content'] = this.configProContent;
    data['weight'] = this.weight;
    data['price_imp'] = this.priceImp;
    data['time_update'] = this.timeUpdate;
    data['combo'] = this.combo;
    data['product_dvt_id'] = this.productDvtId;
    data['thongso'] = this.thongso;
    data['thanhphan'] = this.thanhphan;
    data['huongdan'] = this.huongdan;
    return data;
  }
}

class ConfigPro {
  String? content;
  String? name;
  String? type;
  String? sort;

  ConfigPro({this.content, this.name, this.type, this.sort});

  ConfigPro.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    name = json['name'];
    type = json['type'];
    sort = json['sort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    data['name'] = this.name;
    data['type'] = this.type;
    data['sort'] = this.sort;
    return data;
  }
}

class ProductDvt {
  String? id;
  String? name;
  String? sort;
  String? parentId;

  ProductDvt({this.id, this.name, this.sort, this.parentId});

  ProductDvt.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sort = json['sort'];
    parentId = json['parent_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['sort'] = this.sort;
    data['parent_id'] = this.parentId;
    return data;
  }
}

class Comments {
  String? id;
  String? idSanpham;
  String? comment;
  String? giatri;
  String? userid;
  String? time;
  String? date;
  String? flg;
  String? reply;
  String? review;
  String? userName;
  String? userEmail;
  String? parentId;

  Comments(
      {this.id,
      this.idSanpham,
      this.comment,
      this.giatri,
      this.userid,
      this.time,
      this.date,
      this.flg,
      this.reply,
      this.review,
      this.userName,
      this.userEmail,
      this.parentId});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    idSanpham = json['id_sanpham'] ?? "";
    comment = json['comment'] ?? "";
    giatri = json['giatri'] ?? "";
    userid = json['userid'] ?? "";
    time = json['time'] ?? "";
    date = json['date'] ?? "";
    flg = json['flg'] ?? "";
    reply = json['reply'] ?? "";
    review = json['review'] ?? "";
    userName = json['user_name'] ?? "";
    userEmail = json['user_email'] ?? "";
    parentId = json['parent_id'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_sanpham'] = this.idSanpham;
    data['comment'] = this.comment;
    data['giatri'] = this.giatri;
    data['userid'] = this.userid;
    data['time'] = this.time;
    data['date'] = this.date;
    data['flg'] = this.flg;
    data['reply'] = this.reply;
    data['review'] = this.review;
    data['user_name'] = this.userName;
    data['user_email'] = this.userEmail;
    data['parent_id'] = this.parentId;
    return data;
  }
}

class CateCurrent {
  String? id;
  String? user;
  String? name;
  String? titleSeo;
  String? keywordSeo;
  String? descriptionSeo;
  String? image;
  String? alias;
  String? parentId;
  String? description;
  String? home;
  String? sort;
  String? hot;
  String? coupon;
  String? focus;
  String? lang;
  String? gender;
  String? banner;
  String? contents;
  String? mota;

  CateCurrent(
      {this.id,
      this.user,
      this.name,
      this.titleSeo,
      this.keywordSeo,
      this.descriptionSeo,
      this.image,
      this.alias,
      this.parentId,
      this.description,
      this.home,
      this.sort,
      this.hot,
      this.coupon,
      this.focus,
      this.lang,
      this.gender,
      this.banner,
      this.contents,
      this.mota});

  CateCurrent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    name = json['name'];
    titleSeo = json['title_seo'];
    keywordSeo = json['keyword_seo'];
    descriptionSeo = json['description_seo'];
    image = json['image'];
    alias = json['alias'];
    parentId = json['parent_id'];
    description = json['description'];
    home = json['home'];
    sort = json['sort'];
    hot = json['hot'];
    coupon = json['coupon'];
    focus = json['focus'];
    lang = json['lang'];
    gender = json['gender'];
    banner = json['banner'];
    contents = json['contents'];
    mota = json['mota'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['name'] = this.name;
    data['title_seo'] = this.titleSeo;
    data['keyword_seo'] = this.keywordSeo;
    data['description_seo'] = this.descriptionSeo;
    data['image'] = this.image;
    data['alias'] = this.alias;
    data['parent_id'] = this.parentId;
    data['description'] = this.description;
    data['home'] = this.home;
    data['sort'] = this.sort;
    data['hot'] = this.hot;
    data['coupon'] = this.coupon;
    data['focus'] = this.focus;
    data['lang'] = this.lang;
    data['gender'] = this.gender;
    data['banner'] = this.banner;
    data['contents'] = this.contents;
    data['mota'] = this.mota;
    return data;
  }
}

class SizeSType {
  String? id;
  String? priceSale;
  String? quantity;
  String? priceNiemYet;
  String? statusSize;
  String? name;

  SizeSType(
      {this.id,
      this.priceSale,
      this.quantity,
      this.priceNiemYet,
      this.statusSize,
      this.name});

  SizeSType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    priceSale = json['priceSale'];
    quantity = json['quantity'];
    priceNiemYet = json['priceNiemYet'];
    statusSize = json['statusSize'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['priceSale'] = this.priceSale;
    data['quantity'] = this.quantity;
    data['priceNiemYet'] = this.priceNiemYet;
    data['statusSize'] = this.statusSize;
    data['name'] = this.name;
    return data;
  }
}

class Thuoctinh {
  String? content;
  String? name;
  String? type;
  String? sort;

  Thuoctinh({this.content, this.name, this.type, this.sort});

  Thuoctinh.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    name = json['name'];
    type = json['type'];
    sort = json['sort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    data['name'] = this.name;
    data['type'] = this.type;
    data['sort'] = this.sort;
    return data;
  }
}

class PImages {
  String? id;
  String? image;

  PImages({this.id, this.image});

  PImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }
}
