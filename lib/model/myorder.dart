class MyOrder {
  int? statusCode;
  List<MyOrderData>? data;

  MyOrder({this.statusCode, this.data});

  MyOrder.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    if (json['data'] != null) {
      data = <MyOrderData>[];
      json['data'].forEach((v) {
        data!.add(new MyOrderData.fromJson(v));
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

class MyOrderData {
  String? id;
  String? fullname;
  String? address;
  String? phone;
  String? email;
  String? note;
  Null? itemOrder;
  String? time;
  String? show;
  String? mark;
  Null? adminNote;
  String? province;
  String? district;
  String? ward;
  String? userId;
  String? status;
  String? view;
  String? code;
  Null? person;
  String? startplaces;
  Null? finishplace;
  Null? mobile;
  Null? fax;
  Null? hot;
  Null? startime;
  Null? endtime;
  Null? home;
  Null? otherNote;
  String? codeSale;
  Null? priceSale;
  Null? approved;
  String? totalPrice;
  String? priceShip;
  Null? dai;
  Null? rong;
  Null? cao;
  String? phi;
  Null? giaoHang;
  Null? giaoHangVarchar;
  Null? wards;
  Null? guiDen;
  Null? phiVanchuyen;
  Null? phiCod;
  Null? canNang;
  Null? khoHang;
  Null? noidungMail;
  String? payment;
  Null? maVandon;
  Null? ngayLapvandon;
  Null? thongtinVandon;
  Null? jsonVandon;
  Null? mrcOrderId;
  Null? dulieuGuibaokim;
  Null? baokimGuive;
  Null? tinhCuoc;
  Null? guitinNhan;
  Null? trangthaiGui;
  Null? thoigianGui;
  Null? guitinhphiGhtk;
  Null? tinhphiGhtk;
  Null? transport;
  Null? hamlet;
  Null? pickAddressId;
  Null? addressSet;
  Null? pickName;
  Null? codeShop;
  Null? label;
  Null? guilenDangdon;
  Null? jsonGhtkGui;
  String? affiliateCode;
  String? provinName;
  String? districName;
  Null? wardName;

  MyOrderData(
      {this.id,
      this.fullname,
      this.address,
      this.phone,
      this.email,
      this.note,
      this.itemOrder,
      this.time,
      this.show,
      this.mark,
      this.adminNote,
      this.province,
      this.district,
      this.ward,
      this.userId,
      this.status,
      this.view,
      this.code,
      this.person,
      this.startplaces,
      this.finishplace,
      this.mobile,
      this.fax,
      this.hot,
      this.startime,
      this.endtime,
      this.home,
      this.otherNote,
      this.codeSale,
      this.priceSale,
      this.approved,
      this.totalPrice,
      this.priceShip,
      this.dai,
      this.rong,
      this.cao,
      this.phi,
      this.giaoHang,
      this.giaoHangVarchar,
      this.wards,
      this.guiDen,
      this.phiVanchuyen,
      this.phiCod,
      this.canNang,
      this.khoHang,
      this.noidungMail,
      this.payment,
      this.maVandon,
      this.ngayLapvandon,
      this.thongtinVandon,
      this.jsonVandon,
      this.mrcOrderId,
      this.dulieuGuibaokim,
      this.baokimGuive,
      this.tinhCuoc,
      this.guitinNhan,
      this.trangthaiGui,
      this.thoigianGui,
      this.guitinhphiGhtk,
      this.tinhphiGhtk,
      this.transport,
      this.hamlet,
      this.pickAddressId,
      this.addressSet,
      this.pickName,
      this.codeShop,
      this.label,
      this.guilenDangdon,
      this.jsonGhtkGui,
      this.affiliateCode,
      this.provinName,
      this.districName,
      this.wardName});

  MyOrderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    address = json['address'];
    phone = json['phone'];
    email = json['email'];
    note = json['note'];
    itemOrder = json['item_order'];
    time = json['time'];
    show = json['show'];
    mark = json['mark'];
    adminNote = json['admin_note'];
    province = json['province'];
    district = json['district'];
    ward = json['ward'];
    userId = json['user_id'];
    status = json['status'];
    view = json['view'];
    code = json['code'];
    person = json['person'];
    startplaces = json['startplaces'];
    finishplace = json['finishplace'];
    mobile = json['mobile'];
    fax = json['fax'];
    hot = json['hot'];
    startime = json['startime'];
    endtime = json['endtime'];
    home = json['home'];
    otherNote = json['other_note'];
    codeSale = json['code_sale'];
    priceSale = json['price_sale'];
    approved = json['approved'];
    totalPrice = json['total_price'];
    priceShip = json['price_ship'];
    dai = json['dai'];
    rong = json['rong'];
    cao = json['cao'];
    phi = json['phi'];
    giaoHang = json['giao_hang'];
    giaoHangVarchar = json['giao_hang_varchar'];
    wards = json['wards'];
    guiDen = json['gui_den'];
    phiVanchuyen = json['phi_vanchuyen'];
    phiCod = json['phi_cod'];
    canNang = json['can_nang'];
    khoHang = json['kho_hang'];
    noidungMail = json['noidung_mail'];
    payment = json['payment'];
    maVandon = json['ma_vandon'];
    ngayLapvandon = json['ngay_lapvandon'];
    thongtinVandon = json['thongtin_vandon'];
    jsonVandon = json['json_vandon'];
    mrcOrderId = json['mrc_order_id'];
    dulieuGuibaokim = json['dulieu_guibaokim'];
    baokimGuive = json['baokim_guive'];
    tinhCuoc = json['tinh_cuoc'];
    guitinNhan = json['guitin_nhan'];
    trangthaiGui = json['trangthai_gui'];
    thoigianGui = json['thoigian_gui'];
    guitinhphiGhtk = json['guitinhphi_ghtk'];
    tinhphiGhtk = json['tinhphi_ghtk'];
    transport = json['transport'];
    hamlet = json['hamlet'];
    pickAddressId = json['pick_address_id'];
    addressSet = json['address_set'];
    pickName = json['pick_name'];
    codeShop = json['code_shop'];
    label = json['label'];
    guilenDangdon = json['guilen_dangdon'];
    jsonGhtkGui = json['json_ghtk_gui'];
    affiliateCode = json['affiliateCode'];
    provinName = json['provin_name'];
    districName = json['distric_name'];
    wardName = json['ward_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullname'] = this.fullname;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['note'] = this.note;
    data['item_order'] = this.itemOrder;
    data['time'] = this.time;
    data['show'] = this.show;
    data['mark'] = this.mark;
    data['admin_note'] = this.adminNote;
    data['province'] = this.province;
    data['district'] = this.district;
    data['ward'] = this.ward;
    data['user_id'] = this.userId;
    data['status'] = this.status;
    data['view'] = this.view;
    data['code'] = this.code;
    data['person'] = this.person;
    data['startplaces'] = this.startplaces;
    data['finishplace'] = this.finishplace;
    data['mobile'] = this.mobile;
    data['fax'] = this.fax;
    data['hot'] = this.hot;
    data['startime'] = this.startime;
    data['endtime'] = this.endtime;
    data['home'] = this.home;
    data['other_note'] = this.otherNote;
    data['code_sale'] = this.codeSale;
    data['price_sale'] = this.priceSale;
    data['approved'] = this.approved;
    data['total_price'] = this.totalPrice;
    data['price_ship'] = this.priceShip;
    data['dai'] = this.dai;
    data['rong'] = this.rong;
    data['cao'] = this.cao;
    data['phi'] = this.phi;
    data['giao_hang'] = this.giaoHang;
    data['giao_hang_varchar'] = this.giaoHangVarchar;
    data['wards'] = this.wards;
    data['gui_den'] = this.guiDen;
    data['phi_vanchuyen'] = this.phiVanchuyen;
    data['phi_cod'] = this.phiCod;
    data['can_nang'] = this.canNang;
    data['kho_hang'] = this.khoHang;
    data['noidung_mail'] = this.noidungMail;
    data['payment'] = this.payment;
    data['ma_vandon'] = this.maVandon;
    data['ngay_lapvandon'] = this.ngayLapvandon;
    data['thongtin_vandon'] = this.thongtinVandon;
    data['json_vandon'] = this.jsonVandon;
    data['mrc_order_id'] = this.mrcOrderId;
    data['dulieu_guibaokim'] = this.dulieuGuibaokim;
    data['baokim_guive'] = this.baokimGuive;
    data['tinh_cuoc'] = this.tinhCuoc;
    data['guitin_nhan'] = this.guitinNhan;
    data['trangthai_gui'] = this.trangthaiGui;
    data['thoigian_gui'] = this.thoigianGui;
    data['guitinhphi_ghtk'] = this.guitinhphiGhtk;
    data['tinhphi_ghtk'] = this.tinhphiGhtk;
    data['transport'] = this.transport;
    data['hamlet'] = this.hamlet;
    data['pick_address_id'] = this.pickAddressId;
    data['address_set'] = this.addressSet;
    data['pick_name'] = this.pickName;
    data['code_shop'] = this.codeShop;
    data['label'] = this.label;
    data['guilen_dangdon'] = this.guilenDangdon;
    data['json_ghtk_gui'] = this.jsonGhtkGui;
    data['affiliateCode'] = this.affiliateCode;
    data['provin_name'] = this.provinName;
    data['distric_name'] = this.districName;
    data['ward_name'] = this.wardName;
    return data;
  }
}
