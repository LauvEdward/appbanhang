class NewsDetails {
  int? statusCode;
  NewsDetailsData? data;
  Category? category;

  NewsDetails({this.statusCode, this.data, this.category});

  NewsDetails.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    data = json['data'] != null
        ? new NewsDetailsData.fromJson(json['data'])
        : null;
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class NewsDetailsData {
  String? id;
  String? title;
  String? description;
  Null? hot;
  String? image;
  String? content;
  String? alias;
  String? lang;
  Null? tag;
  String? timeUpdate;
  String? time;
  String? categoryId;
  Null? home;
  String? focus;
  Null? coupon;
  String? titleSeo;
  String? keywordSeo;
  String? descriptionSeo;
  String? video;
  String? view;
  String? active;
  String? button1;
  String? sort;
  Null? danhSChTin;
  String? aid;
  String? productId;

  NewsDetailsData(
      {this.id,
      this.title,
      this.description,
      this.hot,
      this.image,
      this.content,
      this.alias,
      this.lang,
      this.tag,
      this.timeUpdate,
      this.time,
      this.categoryId,
      this.home,
      this.focus,
      this.coupon,
      this.titleSeo,
      this.keywordSeo,
      this.descriptionSeo,
      this.video,
      this.view,
      this.active,
      this.button1,
      this.sort,
      this.danhSChTin,
      this.aid,
      this.productId});

  NewsDetailsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    hot = json['hot'];
    image = json['image'];
    content = json['content'];
    alias = json['alias'];
    lang = json['lang'];
    tag = json['tag'];
    timeUpdate = json['time_update'];
    time = json['time'];
    categoryId = json['category_id'];
    home = json['home'];
    focus = json['focus'];
    coupon = json['coupon'];
    titleSeo = json['title_seo'];
    keywordSeo = json['keyword_seo'];
    descriptionSeo = json['description_seo'];
    video = json['video'];
    view = json['view'];
    active = json['active'];
    button1 = json['button_1'];
    sort = json['sort'];
    danhSChTin = json['Danh sách tin'];
    aid = json['aid'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['hot'] = this.hot;
    data['image'] = this.image;
    data['content'] = this.content;
    data['alias'] = this.alias;
    data['lang'] = this.lang;
    data['tag'] = this.tag;
    data['time_update'] = this.timeUpdate;
    data['time'] = this.time;
    data['category_id'] = this.categoryId;
    data['home'] = this.home;
    data['focus'] = this.focus;
    data['coupon'] = this.coupon;
    data['title_seo'] = this.titleSeo;
    data['keyword_seo'] = this.keywordSeo;
    data['description_seo'] = this.descriptionSeo;
    data['video'] = this.video;
    data['view'] = this.view;
    data['active'] = this.active;
    data['button_1'] = this.button1;
    data['sort'] = this.sort;
    data['Danh sách tin'] = this.danhSChTin;
    data['aid'] = this.aid;
    data['product_id'] = this.productId;
    return data;
  }
}

class Category {
  String? id;
  String? name;
  String? alias;
  String? description;
  Null? image;
  String? parentId;
  Null? home;
  Null? focus;
  Null? hot;
  String? coupon;
  Null? cate;
  Null? timeUpdate;
  Null? timeStart;
  String? sort;
  String? lang;
  String? titleSeo;
  Null? keyword;
  String? descriptionSeo;
  String? buttonViewLeft;
  String? buttonViewRight;

  Category(
      {this.id,
      this.name,
      this.alias,
      this.description,
      this.image,
      this.parentId,
      this.home,
      this.focus,
      this.hot,
      this.coupon,
      this.cate,
      this.timeUpdate,
      this.timeStart,
      this.sort,
      this.lang,
      this.titleSeo,
      this.keyword,
      this.descriptionSeo,
      this.buttonViewLeft,
      this.buttonViewRight});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    alias = json['alias'];
    description = json['description'];
    image = json['image'];
    parentId = json['parent_id'];
    home = json['home'];
    focus = json['focus'];
    hot = json['hot'];
    coupon = json['coupon'];
    cate = json['cate'];
    timeUpdate = json['time_update'];
    timeStart = json['time_start'];
    sort = json['sort'];
    lang = json['lang'];
    titleSeo = json['title_seo'];
    keyword = json['keyword'];
    descriptionSeo = json['description_seo'];
    buttonViewLeft = json['button_view_left'];
    buttonViewRight = json['button_view_right'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['alias'] = this.alias;
    data['description'] = this.description;
    data['image'] = this.image;
    data['parent_id'] = this.parentId;
    data['home'] = this.home;
    data['focus'] = this.focus;
    data['hot'] = this.hot;
    data['coupon'] = this.coupon;
    data['cate'] = this.cate;
    data['time_update'] = this.timeUpdate;
    data['time_start'] = this.timeStart;
    data['sort'] = this.sort;
    data['lang'] = this.lang;
    data['title_seo'] = this.titleSeo;
    data['keyword'] = this.keyword;
    data['description_seo'] = this.descriptionSeo;
    data['button_view_left'] = this.buttonViewLeft;
    data['button_view_right'] = this.buttonViewRight;
    return data;
  }
}
