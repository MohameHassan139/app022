import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  //method url
  Future<Response>? getdata({
    required String path,
    required  map,
  }) async {
    return await dio!.get(
      path,
      queryParameters: map,
    );
  }
}
