// To parse this JSON data, do
//
//     final bitcoinTicker = bitcoinTickerFromJson(jsonString);

import 'dart:convert';

BitcoinTicker bitcoinTickerFromJson(String str) => BitcoinTicker.fromJson(json.decode(str));

String bitcoinTickerToJson(BitcoinTicker data) => json.encode(data.toJson());

class BitcoinTicker {
    BitcoinTicker({
        this.time,
        this.disclaimer,
        this.bpi,
    });

    Time time;
    String disclaimer;
    Map<String, Bpi> bpi;

    factory BitcoinTicker.fromJson(Map<String, dynamic> json) => BitcoinTicker(
        time: json["time"] == null ? null : Time.fromJson(json["time"]),
        disclaimer: json["disclaimer"] == null ? null : json["disclaimer"],
        bpi: json["bpi"] == null ? null : Map.from(json["bpi"]).map((k, v) => MapEntry<String, Bpi>(k, Bpi.fromJson(v))),
    );

    Map<String, dynamic> toJson() => {
        "time": time == null ? null : time.toJson(),
        "disclaimer": disclaimer == null ? null : disclaimer,
        "bpi": bpi == null ? null : Map.from(bpi).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
}

class Bpi {
    Bpi({
        this.code,
        this.rate,
        this.description,
        this.rateFloat,
    });

    String code;
    String rate;
    String description;
    double rateFloat;

    factory Bpi.fromJson(Map<String, dynamic> json) => Bpi(
        code: json["code"] == null ? null : json["code"],
        rate: json["rate"] == null ? null : json["rate"],
        description: json["description"] == null ? null : json["description"],
        rateFloat: json["rate_float"] == null ? null : json["rate_float"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "rate": rate == null ? null : rate,
        "description": description == null ? null : description,
        "rate_float": rateFloat == null ? null : rateFloat,
    };
}

class Time {
    Time({
        this.updated,
        this.updatedIso,
        this.updateduk,
    });

    String updated;
    DateTime updatedIso;
    String updateduk;

    factory Time.fromJson(Map<String, dynamic> json) => Time(
        updated: json["updated"] == null ? null : json["updated"],
        updatedIso: json["updatedISO"] == null ? null : DateTime.parse(json["updatedISO"]),
        updateduk: json["updateduk"] == null ? null : json["updateduk"],
    );

    Map<String, dynamic> toJson() => {
        "updated": updated == null ? null : updated,
        "updatedISO": updatedIso == null ? null : updatedIso.toIso8601String(),
        "updateduk": updateduk == null ? null : updateduk,
    };
}
