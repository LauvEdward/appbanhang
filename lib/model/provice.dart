class Provice {
  String? id;
  String? code;
  String? name;
  String? mien;
  String? noitinh;
  String? coCod;
  String? koCod;

  Provice(
      {this.id,
      this.code,
      this.name,
      this.mien,
      this.noitinh,
      this.coCod,
      this.koCod});

  Provice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    mien = json['mien'];
    noitinh = json['noitinh'];
    coCod = json['co_cod'];
    koCod = json['ko_cod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['mien'] = this.mien;
    data['noitinh'] = this.noitinh;
    data['co_cod'] = this.coCod;
    data['ko_cod'] = this.koCod;
    return data;
  }
}

class District {
  String? id;
  String? code;
  String? value;
  String? name;
  String? tinhId;

  District({this.id, this.code, this.value, this.name, this.tinhId});

  District.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    value = json['value'];
    name = json['name'];
    tinhId = json['tinh_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['value'] = this.value;
    data['name'] = this.name;
    data['tinh_id'] = this.tinhId;
    return data;
  }
}
