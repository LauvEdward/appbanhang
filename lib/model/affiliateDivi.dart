class affiliateDivi {
  affiliateDiviData? data;

  affiliateDivi({this.data});

  affiliateDivi.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new affiliateDiviData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class affiliateDiviData {
  Code? code;
  SumTotal? sumTotal;
  List<Order>? order;

  affiliateDiviData({this.code, this.sumTotal, this.order});

  affiliateDiviData.fromJson(Map<String, dynamic> json) {
    code = json['code'] != null ? new Code.fromJson(json['code']) : null;
    sumTotal = json['sumTotal'] != null
        ? new SumTotal.fromJson(json['sumTotal'])
        : null;
    if (json['order'] != null) {
      order = <Order>[];
      json['order'].forEach((v) {
        order!.add(new Order.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.code != null) {
      data['code'] = this.code!.toJson();
    }
    if (this.sumTotal != null) {
      data['sumTotal'] = this.sumTotal!.toJson();
    }
    if (this.order != null) {
      data['order'] = this.order!.map((v) => v.toJson()).toList();
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
  String? linkRefCode;
  String? bankName;
  String? bankBranch;
  String? bankAccountNumber;
  String? bankAccountHolder;
  String? bonusValue;

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
      this.bonusType,
      this.linkRefCode,
      this.bankName,
      this.bankBranch,
      this.bankAccountNumber,
      this.bankAccountHolder,
      this.bonusValue});

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
    linkRefCode = json['linkRefCode'];
    bankName = json['bankName'];
    bankBranch = json['bankBranch'];
    bankAccountNumber = json['bankAccountNumber'];
    bankAccountHolder = json['bankAccountHolder'];
    bonusValue = json['bonusValue'];
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
    data['linkRefCode'] = this.linkRefCode;
    data['bankName'] = this.bankName;
    data['bankBranch'] = this.bankBranch;
    data['bankAccountNumber'] = this.bankAccountNumber;
    data['bankAccountHolder'] = this.bankAccountHolder;
    data['bonusValue'] = this.bonusValue;
    return data;
  }
}

class SumTotal {
  String? codeId;
  String? totalOrder;
  String? totalOrderValue;
  String? totalOrderValueSuccess;
  String? totalBonus;

  SumTotal(
      {this.codeId,
      this.totalOrder,
      this.totalOrderValue,
      this.totalOrderValueSuccess,
      this.totalBonus});

  SumTotal.fromJson(Map<String, dynamic> json) {
    codeId = json['codeId'];
    totalOrder = json['totalOrder'];
    totalOrderValue = json['totalOrderValue'];
    totalOrderValueSuccess = json['totalOrderValueSuccess'];
    totalBonus = json['totalBonus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codeId'] = this.codeId;
    data['totalOrder'] = this.totalOrder;
    data['totalOrderValue'] = this.totalOrderValue;
    data['totalOrderValueSuccess'] = this.totalOrderValueSuccess;
    data['totalBonus'] = this.totalBonus;
    return data;
  }
}

class Order {
  String? orderCode;
  String? orderFullName;
  String? orderStatus;
  String? orderTotalMoney;
  String? codeBonus;

  Order(
      {this.orderCode,
      this.orderFullName,
      this.orderStatus,
      this.orderTotalMoney,
      this.codeBonus});

  Order.fromJson(Map<String, dynamic> json) {
    orderCode = json['orderCode'];
    orderFullName = json['orderFullName'];
    orderStatus = json['orderStatus'];
    orderTotalMoney = json['orderTotalMoney'];
    codeBonus = json['codeBonus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderCode'] = this.orderCode;
    data['orderFullName'] = this.orderFullName;
    data['orderStatus'] = this.orderStatus;
    data['orderTotalMoney'] = this.orderTotalMoney;
    data['codeBonus'] = this.codeBonus;
    return data;
  }
}
