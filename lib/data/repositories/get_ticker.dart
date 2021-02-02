import 'dart:convert';

import 'package:dio/dio.dart';

class TickerApi {
  Dio dio = new Dio();

  Future<Map<String, dynamic>> index(String code) async {
    try {
      Response response = await dio.get(
        'https://api.coindesk.com/v1/bpi/currentprice/${code.toUpperCase()}.json',
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
