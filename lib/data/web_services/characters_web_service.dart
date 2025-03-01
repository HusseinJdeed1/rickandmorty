import 'package:dio/dio.dart';

import '../../constants/strings.dart';

class CharactersWebServices {
  late Dio dio;
  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 90),
      receiveTimeout: Duration(seconds: 90),
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getCharacters() async {
    try {
      Response response = await dio.get("/character");
      return response.data["results"];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
