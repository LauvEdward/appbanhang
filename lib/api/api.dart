import 'package:dio/dio.dart';

class API {
  static API share = API();
  var baseUrl = 'https://thoitranggda.getly.site/api';
  var baseSite = 'https://thoitranggda.getly.site';
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
}
