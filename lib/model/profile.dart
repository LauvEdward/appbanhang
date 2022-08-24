import 'package:appbanhang/model/user.dart';

class Profile {
  String? id;
  String? md5Id;
  String? username;
  String? phone;
  String? email;
  String? password;
  String? fullname;
  String? useSalt;
  String? shopName;
  String? avtDir;
  String? avatar;
  String? useLogo;
  String? block;
  String? birthday;
  String? sex;
  String? address;
  String? addressProvince;
  String? addressDistrict;
  String? addressWard;
  String? useMobile;
  String? useFace;
  String? useYahoo;
  String? useSkype;
  String? useGroup;
  String? active;
  String? useKey;
  String? smskey;
  String? token;
  String? deleted;
  String? useRegisdate;
  String? useEnddate;
  String? lastestLogin;
  String? signupDate;
  String? lever;
  String? bankAccount;
  String? ghichu;
  String? cmnd;
  Profile.userinfo(this.email, this.password, this.fullname, this.phone,
      this.bankAccount, this.ghichu, this.sex, this.addressProvince);

  Profile(
      {this.id,
      this.md5Id,
      this.username,
      this.phone,
      this.email,
      this.password,
      this.fullname,
      this.useSalt,
      this.shopName,
      this.avtDir,
      this.avatar,
      this.useLogo,
      this.block,
      this.birthday,
      this.sex,
      this.address,
      this.addressProvince,
      this.addressDistrict,
      this.addressWard,
      this.useMobile,
      this.useFace,
      this.useYahoo,
      this.useSkype,
      this.useGroup,
      this.active,
      this.useKey,
      this.smskey,
      this.token,
      this.deleted,
      this.useRegisdate,
      this.useEnddate,
      this.lastestLogin,
      this.signupDate,
      this.lever,
      this.bankAccount,
      this.ghichu,
      this.cmnd});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    md5Id = json['md5_id'] ?? "";
    username = json['username'] ?? "";
    phone = json['phone'] ?? "";
    email = json['email'] ?? "";
    password = json['password'] ?? "";
    fullname = json['fullname'] ?? "";
    useSalt = json['use_salt'] ?? "";
    shopName = json['shop_name'] ?? "";
    avtDir = json['avt_dir'] ?? "";
    avatar = json['avatar'] ?? "";
    useLogo = json['use_logo'] ?? "";
    block = json['block'] ?? "";
    birthday = json['birthday'] ?? "";
    sex = json['sex'] ?? "";
    address = json['address'] ?? "";
    addressProvince = json['address_province'] ?? "";
    addressDistrict = json['address_district'] ?? "";
    addressWard = json['address_ward'] ?? "";
    useMobile = json['use_mobile'] ?? "";
    useFace = json['use_face'] ?? "";
    useYahoo = json['use_yahoo'] ?? "";
    useSkype = json['use_skype'] ?? "";
    useGroup = json['use_group'] ?? "";
    active = json['active'] ?? "";
    useKey = json['use_key'] ?? "";
    smskey = json['smskey'] ?? "";
    token = json['token'] ?? "";
    deleted = json['deleted'];
    useRegisdate = json['use_regisdate'] ?? "";
    useEnddate = json['use_enddate'] ?? "";
    lastestLogin = json['lastest_login'] ?? "";
    signupDate = json['signup_date'] ?? "";
    lever = json['lever'] ?? "";
    bankAccount = json['bank_account'] ?? "";
    ghichu = json['ghichu'] ?? "";
    cmnd = json['cmnd'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['md5_id'] = this.md5Id;
    data['username'] = this.username;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['password'] = this.password;
    data['fullname'] = this.fullname;
    data['use_salt'] = this.useSalt;
    data['shop_name'] = this.shopName;
    data['avt_dir'] = this.avtDir;
    data['avatar'] = this.avatar;
    data['use_logo'] = this.useLogo;
    data['block'] = this.block;
    data['birthday'] = this.birthday;
    data['sex'] = this.sex;
    data['address'] = this.address;
    data['address_province'] = this.addressProvince;
    data['address_district'] = this.addressDistrict;
    data['address_ward'] = this.addressWard;
    data['use_mobile'] = this.useMobile;
    data['use_face'] = this.useFace;
    data['use_yahoo'] = this.useYahoo;
    data['use_skype'] = this.useSkype;
    data['use_group'] = this.useGroup;
    data['active'] = this.active;
    data['use_key'] = this.useKey;
    data['smskey'] = this.smskey;
    data['token'] = this.token;
    data['deleted'] = this.deleted;
    data['use_regisdate'] = this.useRegisdate;
    data['use_enddate'] = this.useEnddate;
    data['lastest_login'] = this.lastestLogin;
    data['signup_date'] = this.signupDate;
    data['lever'] = this.lever;
    data['bank_account'] = this.bankAccount;
    data['ghichu'] = this.ghichu;
    data['cmnd'] = this.cmnd;
    return data;
  }
}
