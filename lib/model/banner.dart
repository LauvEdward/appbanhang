class banner {
  int? statusCode;
  List<bannerData>? data;

  banner({this.statusCode, this.data});

  banner.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    if (json['data'] != null) {
      data = <bannerData>[];
      json['data'].forEach((v) {
        data!.add(new bannerData.fromJson(v));
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

class bannerData {
  String? id;
  String? type;
  String? url;
  String? title;
  String? target;
  String? name;
  String? image;
  String? idItem;
  String? sort;
  String? cate;
  String? lang;
  String? content;

  bannerData(
      {this.id,
      this.type,
      this.url,
      this.title,
      this.target,
      this.name,
      this.image,
      this.idItem,
      this.sort,
      this.cate,
      this.lang,
      this.content});

  bannerData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    url = json['url'];
    title = json['title'];
    target = json['target'];
    name = json['name'];
    image = json['image'];
    idItem = json['id_item'];
    sort = json['sort'];
    cate = json['cate'];
    lang = json['lang'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['url'] = this.url;
    data['title'] = this.title;
    data['target'] = this.target;
    data['name'] = this.name;
    data['image'] = this.image;
    data['id_item'] = this.idItem;
    data['sort'] = this.sort;
    data['cate'] = this.cate;
    data['lang'] = this.lang;
    data['content'] = this.content;
    return data;
  }
}
