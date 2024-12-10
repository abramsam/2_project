// POST
// UPDATE
// DELETE


// GET
// https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0040ca
// https://newsapi.org/v2/everything?q=tesla&apiKey=65f7f556ec76449fa7dc7c0069f040ca

// base URL : https://newsapi.org/
// method (URL) : v2/top-headlines?
// Queries : country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca

import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) {
    return dio!.get(
      url,
      queryParameters: query,
    );
  }
}
