class News {
  int? statusCode;
  List<DataNews>? data;

  News({this.statusCode, this.data});

  News.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    if (json['data'] != null) {
      data = <DataNews>[];
      json['data'].forEach((v) {
        data!.add(new DataNews.fromJson(v));
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

class DataNews {
  String? id;
  String? title;
  String? description;
  Null? hot;
  String? image;
  String? lang;
  Null? tag;
  String? timeUpdate;
  String? time;
  String? categoryId;
  Null? home;
  String? focus;
  Null? coupon;
  String? video;
  String? view;
  String? active;
  String? button1;
  String? sort;
  Null? danhSChTin;
  String? aid;
  String? productId;

  DataNews(
      {this.id,
      this.title,
      this.description,
      this.hot,
      this.image,
      this.lang,
      this.tag,
      this.timeUpdate,
      this.time,
      this.categoryId,
      this.home,
      this.focus,
      this.coupon,
      this.video,
      this.view,
      this.active,
      this.button1,
      this.sort,
      this.danhSChTin,
      this.aid,
      this.productId});

  DataNews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    hot = json['hot'];
    image = json['image'];
    lang = json['lang'];
    tag = json['tag'];
    timeUpdate = json['time_update'];
    time = json['time'];
    categoryId = json['category_id'];
    home = json['home'];
    focus = json['focus'];
    coupon = json['coupon'];
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
    data['lang'] = this.lang;
    data['tag'] = this.tag;
    data['time_update'] = this.timeUpdate;
    data['time'] = this.time;
    data['category_id'] = this.categoryId;
    data['home'] = this.home;
    data['focus'] = this.focus;
    data['coupon'] = this.coupon;
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
