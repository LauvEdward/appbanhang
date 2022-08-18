class NewsPost {
  int? statusCode;
  List<NewsPostData>? data;
  Page? page;

  NewsPost({this.statusCode, this.data, this.page});

  NewsPost.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    if (json['data'] != null) {
      data = <NewsPostData>[];
      json['data'].forEach((v) {
        data!.add(new NewsPostData.fromJson(v));
      });
    }
    page = json['page'] != null ? new Page.fromJson(json['page']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.page != null) {
      data['page'] = this.page!.toJson();
    }
    return data;
  }
}

class NewsPostData {
  String? id;
  String? title;
  String? description;
  String? image;
  String? time;

  NewsPostData({this.id, this.title, this.description, this.image, this.time});

  NewsPostData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['time'] = this.time;
    return data;
  }
}

class Page {
  int? totalRows;
  int? perPage;
  int? totalPage;

  Page({this.totalRows, this.perPage, this.totalPage});

  Page.fromJson(Map<String, dynamic> json) {
    totalRows = json['total_rows'];
    perPage = json['per_page'];
    totalPage = json['total_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_rows'] = this.totalRows;
    data['per_page'] = this.perPage;
    data['total_page'] = this.totalPage;
    return data;
  }
}
