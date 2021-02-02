// To parse this JSON data, do
//
//     final coins = coinsFromJson(jsonString);

import 'dart:convert';

List<Coins> coinsFromJson(String str) => List<Coins>.from(json.decode(str).map((x) => Coins.fromJson(x)));

String coinsToJson(List<Coins> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Coins {
    Coins({
        this.currency,
        this.country,
    });

    String currency;
    String country;

    factory Coins.fromJson(Map<String, dynamic> json) => Coins(
        currency: json["currency"] == null ? null : json["currency"],
        country: json["country"] == null ? null : json["country"],
    );

    Map<String, dynamic> toJson() => {
        "currency": currency == null ? null : currency,
        "country": country == null ? null : country,
    };
}
