class CategoryProduct {
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

  CategoryProduct(
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

  CategoryProduct.fromJson(Map<String, dynamic> json) {
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
    data['id'] = this.id ?? "";
    data['user'] = this.user ?? "";
    data['name'] = this.name ?? "";
    data['title_seo'] = this.titleSeo ?? "";
    data['keyword_seo'] = this.keywordSeo ?? "";
    data['description_seo'] = this.descriptionSeo ?? "";
    data['image'] = this.image ?? "";
    data['alias'] = this.alias ?? "";
    data['parent_id'] = this.parentId ?? "";
    data['description'] = this.description ?? "";
    data['home'] = this.home ?? "";
    data['sort'] = this.sort ?? "";
    data['hot'] = this.hot ?? "";
    data['coupon'] = this.coupon ?? "";
    data['focus'] = this.focus ?? "";
    data['lang'] = this.lang ?? "";
    data['gender'] = this.gender ?? "";
    data['banner'] = this.banner ?? "";
    data['contents'] = this.contents ?? "";
    data['mota'] = this.mota ?? "";
    return data;
  }
}
