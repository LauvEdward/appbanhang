class promotion {
  int? statusCode;
  promotionData? data;

  promotion({this.statusCode, this.data});

  promotion.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    data =
        json['data'] != null ? new promotionData.fromJson(json['data']) : null;
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

class promotionData {
  Code? code;
  List<Promotion>? promotion;

  promotionData({this.code, this.promotion});

  promotionData.fromJson(Map<String, dynamic> json) {
    code = json['code'] != null ? new Code.fromJson(json['code']) : null;
    if (json['promotion'] != null) {
      promotion = <Promotion>[];
      json['promotion'].forEach((v) {
        promotion!.add(new Promotion.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.code != null) {
      data['code'] = this.code!.toJson();
    }
    if (this.promotion != null) {
      data['promotion'] = this.promotion!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Code {
  String? content;
  String? groupId;
  String? status;
  String? approvedById;
  String? approvedDateTime;
  String? createdById;
  String? createdDate;
  String? createdTime;
  String? value;
  String? bonusType;

  Code(
      {this.content,
      this.groupId,
      this.status,
      this.approvedById,
      this.approvedDateTime,
      this.createdById,
      this.createdDate,
      this.createdTime,
      this.value,
      this.bonusType});

  Code.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    groupId = json['groupId'];
    status = json['status'];
    approvedById = json['approvedById'];
    approvedDateTime = json['approvedDateTime'];
    createdById = json['createdById'];
    createdDate = json['createdDate'];
    createdTime = json['createdTime'];
    value = json['value'];
    bonusType = json['bonusType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    data['groupId'] = this.groupId;
    data['status'] = this.status;
    data['approvedById'] = this.approvedById;
    data['approvedDateTime'] = this.approvedDateTime;
    data['createdById'] = this.createdById;
    data['createdDate'] = this.createdDate;
    data['createdTime'] = this.createdTime;
    data['value'] = this.value;
    data['bonusType'] = this.bonusType;
    return data;
  }
}

class Promotion {
  int? typePost;
  String? name;
  String? description;
  Conditions? conditions;
  String? getStartDate;
  String? getEndDate;

  Promotion(
      {this.typePost,
      this.name,
      this.description,
      this.conditions,
      this.getStartDate,
      this.getEndDate});

  Promotion.fromJson(Map<String, dynamic> json) {
    typePost = json['typePost'];
    name = json['name'];
    description = json['description'];
    conditions = json['conditions'] != null
        ? new Conditions.fromJson(json['conditions'])
        : null;
    getStartDate = json['getStartDate'];
    getEndDate = json['getEndDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['typePost'] = this.typePost;
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.conditions != null) {
      data['conditions'] = this.conditions!.toJson();
    }
    data['getStartDate'] = this.getStartDate;
    data['getEndDate'] = this.getEndDate;
    return data;
  }
}

class Conditions {
  AffiliateBillValue? affiliateBillValue;
  AffiliateGroups? affiliateGroups;
  List<AffiliateProducts>? affiliateProducts;

  Conditions(
      {this.affiliateBillValue, this.affiliateGroups, this.affiliateProducts});

  Conditions.fromJson(Map<String, dynamic> json) {
    affiliateBillValue = json['affiliate_bill_value'] != null
        ? new AffiliateBillValue.fromJson(json['affiliate_bill_value'])
        : null;
    affiliateGroups = json['affiliate_groups'] != null
        ? new AffiliateGroups.fromJson(json['affiliate_groups'])
        : null;
    if (json['affiliate_products'] != null) {
      affiliateProducts = <AffiliateProducts>[];
      json['affiliate_products'].forEach((v) {
        affiliateProducts!.add(new AffiliateProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.affiliateBillValue != null) {
      data['affiliate_bill_value'] = this.affiliateBillValue!.toJson();
    }
    if (this.affiliateGroups != null) {
      data['affiliate_groups'] = this.affiliateGroups!.toJson();
    }
    if (this.affiliateProducts != null) {
      data['affiliate_products'] =
          this.affiliateProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AffiliateBillValue {
  String? discountType;
  String? bonus;
  int? fromValue;
  int? toValue;

  AffiliateBillValue(
      {this.discountType, this.bonus, this.fromValue, this.toValue});

  AffiliateBillValue.fromJson(Map<String, dynamic> json) {
    discountType = json['discountType'];
    bonus = json['bonus'];
    fromValue = json['fromValue'];
    toValue = json['toValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['discountType'] = this.discountType;
    data['bonus'] = this.bonus;
    data['fromValue'] = this.fromValue;
    data['toValue'] = this.toValue;
    return data;
  }
}

class AffiliateGroups {
  String? discountType;
  String? bonus;

  AffiliateGroups({this.discountType, this.bonus});

  AffiliateGroups.fromJson(Map<String, dynamic> json) {
    discountType = json['discountType'];
    bonus = json['bonus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['discountType'] = this.discountType;
    data['bonus'] = this.bonus;
    return data;
  }
}

class AffiliateProducts {
  String? discountType;
  String? bonus;
  String? productName;

  AffiliateProducts({this.discountType, this.bonus, this.productName});

  AffiliateProducts.fromJson(Map<String, dynamic> json) {
    discountType = json['discountType'];
    bonus = json['bonus'];
    productName = json['productName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['discountType'] = this.discountType;
    data['bonus'] = this.bonus;
    data['productName'] = this.productName;
    return data;
  }
}
