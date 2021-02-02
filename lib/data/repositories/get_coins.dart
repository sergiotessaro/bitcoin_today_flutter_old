import 'dart:convert';

import 'package:dio/dio.dart';

class CoinsApi {
  Dio dio = new Dio();

  Future<List<dynamic>> index() async {
    try {
      Response response = await dio.get(
        'https://api.coindesk.com/v1/bpi/supported-currencies.json',
        options: Options(headers: {
          "Content-Type": "application/json; charset=utf-8",
        }, responseType: ResponseType.json),
      );
      print(response);
      return json.decode(response.data);
    } catch (e) {
      throw e;
    }
  }
}
