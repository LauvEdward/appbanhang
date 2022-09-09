import 'package:appbanhang/@core/shared_preference.dart';
import 'package:appbanhang/model/profile.dart';
import 'package:appbanhang/model/user.dart';
import 'package:dio/dio.dart';

class API {
  static API share = API();
  var baseUrl = 'https://thoitranggda.getly.site/api';
  var baseSite = 'https://thoitranggda.getly.site';
  Future<Response> GetCategory() async {
    final dio = Dio();
    final response = await dio.get(baseUrl + '/home/category');
    return response;
  }

  Future<Response> Getbanner() async {
    final dio = Dio();
    final response = await dio.get(baseUrl + '/home/banner');
    return response;
  }

  Future<Response> GetListProduct() async {
    final dio = Dio();
    final response = await dio.get(baseUrl + '/home/product');
    return response;
  }

  Future<Response> GetHotProduct() async {
    final dio = Dio();
    final response = await dio.get(baseUrl + '/home/product-hot');
    return response;
  }

  Future<Response> GetNewProduct() async {
    final dio = Dio();
    final response = await dio.get(baseUrl + '/home/news-hot');
    return response;
  }

  // Detail product
  Future<Response> GetDetailProduct(int id) async {
    final dio = Dio();
    final response = await dio
        .get(baseUrl + '/product/detail', queryParameters: {"product_id": id});
    return response;
  }

  // news
  Future<Response> GetListNew(int id, String search) async {
    final dio = Dio();
    final response = await dio.get(baseUrl + '/news',
        queryParameters: {"search": search, "page": id});
    return response;
  }

  Future<Response> GetNewsDetail(int id) async {
    final dio = Dio();
    final response = await dio
        .get(baseUrl + '/news/detail', queryParameters: {"news_id": id});
    return response;
  }

  Future<Response> GetAllProduct(String sort, String search, int page) async {
    final dio = Dio();
    final response = await dio.get(baseUrl + '/product',
        queryParameters: {"sort": sort, "search": search, "page": page});
    return response;
  }

  Future<Response> GetAllProductByCatrgory(
      String sort, String search, int id) async {
    final dio = Dio();
    final response = await dio.get(baseUrl + '/product/by-category',
        queryParameters: {"sort": sort, "search": search, "category_id": id});
    return response;
  }

  // API Login
  Future<Response> postLogin(String username, String password) async {
    final dio = Dio();
    dio.options.contentType = Headers.formUrlEncodedContentType;
    final response = await dio.post(baseUrl + '/auth/login',
        data: {"email": username, "password": password},
        options: Options(contentType: Headers.formUrlEncodedContentType));

    return response;
  }

  Future<Response> postProfile(User user) async {
    final dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['authorization'] = 'Bearer ${user.access_token}';
    final response = await dio.get(baseUrl + '/auth/profile');
    return response;
  }

  Future<Response> getProvice() async {
    final dio = Dio();
    final response = await dio.get(baseUrl + '/address/province');
    return response;
  }

  Future<Response> getDistrict(int id) async {
    final dio = Dio();
    final response = await dio.get(baseUrl + '/address/district',
        queryParameters: {"province_id": id});
    return response;
  }

  Future<Response> registerUser(Profile user) async {
    final dio = Dio();
    dio.options.contentType = Headers.formUrlEncodedContentType;
    dio.options.contentType = Headers.formUrlEncodedContentType;
    final response = await dio.post(baseUrl + '/auth/register',
        data: {
          "email": user.email,
          "password": user.password,
          "fullname": user.fullname,
          "phone": user.phone,
          "bank_account": user.bankAccount,
          "ghichu": user.ghichu,
          "sex": user.sex,
          "province": user.addressProvince,
        },
        options: Options(contentType: Headers.formUrlEncodedContentType));

    return response;
  }

  Future<Response> checkCart(Map<String, String> cate) async {
    final dio = Dio();
    dio.options.contentType = Headers.formUrlEncodedContentType;
    final response = await dio.post(baseUrl + '/cart/check-cart',
        data: cate,
        options: Options(contentType: Headers.formUrlEncodedContentType));
    return response;
  }

  Future<Response> checkoutCart(Map<String, Object> cate) async {
    String? token = await AppSharePreference.share.getTokenSharePreference();
    final dio = Dio();
    dio.options.contentType = Headers.formUrlEncodedContentType;
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['authorization'] = 'Bearer ${token}';
    final response = await dio.post(baseUrl + '/cart/checkout',
        data: cate,
        options: Options(contentType: Headers.formUrlEncodedContentType));
    return response;
  }

  Future<Response> getMyorder() async {
    String? token = await AppSharePreference.share.getTokenSharePreference();
    final dio = Dio();
    dio.options.contentType = Headers.formUrlEncodedContentType;
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['authorization'] = 'Bearer ${token}';
    final response = await dio.get(baseUrl + '/cart/my-order');
    return response;
  }

  Future<Response> changePassword(Map<String, Object> cate) async {
    String? token = await AppSharePreference.share.getTokenSharePreference();
    final dio = Dio();
    dio.options.contentType = Headers.formUrlEncodedContentType;
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['authorization'] = 'Bearer ${token}';
    final response = await dio.post(baseUrl + '/auth/change-password',
        data: cate,
        options: Options(contentType: Headers.formUrlEncodedContentType));
    return response;
  }

  /// affiliate
  Future<Response> getAffiliate() async {
    String? token = await AppSharePreference.share.getTokenSharePreference();
    final dio = Dio();
    dio.options.contentType = Headers.formUrlEncodedContentType;
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['authorization'] = 'Bearer ${token}';
    final response = await dio.get(baseUrl + '/affiliate/promotion');
    return response;
  }

  // contact
  Future<Response> getcontact() async {
    String? token = await AppSharePreference.share.getTokenSharePreference();
    final dio = Dio();
    dio.options.contentType = Headers.formUrlEncodedContentType;
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['authorization'] = 'Bearer ${token}';
    final response = await dio.get(baseUrl + '/contact/info');
    return response;
  }

  Future<Response> profileUpdate(Profile user) async {
    try {
      String? token = await AppSharePreference.share.getTokenSharePreference();
      final dio = Dio();
      dio.options.contentType = Headers.formUrlEncodedContentType;
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['authorization'] = 'Bearer ${token}';
      final response = await dio.post(baseUrl + '/auth/update-profile',
          data: {
            "fullname": user.fullname,
            "phone": user.phone,
            "cmnd": user.cmnd,
            "ghichu": user.ghichu,
            "bank_account": user.bankAccount,
            "birthday": user.birthday,
            "address": user.address,
            "province": user.addressProvince,
            "address_district": user.addressDistrict
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
