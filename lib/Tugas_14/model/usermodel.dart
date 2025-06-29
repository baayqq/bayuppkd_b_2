import 'dart:convert';

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);


List<DataApi> welcomeFromJson(String str) =>
    List<DataApi>.from(json.decode(str).map((x) => DataApi.fromJson(x)));

String welcomeToJson(List<DataApi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataApi {
  String? id;
  String? symbol;
  String? name;
  String? image;
  double? currentPrice;
  double? marketCap;
  double? marketCapRank;
  double? fullyDilutedValuation;
  double? totalVolume;
  double? high24H;
  double? low24H;
  double? priceChange24H;
  double? priceChangePercentage24H;
  double? marketCapChange24H;
  double? marketCapChangePercentage24H;
  double? circulatingSupply;
  double? totalSupply;
  double? maxSupply;
  double? ath;
  double? athChangePercentage;
  DateTime? athDate;
  double? atl;
  double? atlChangePercentage;
  DateTime? atlDate;
  DataUser? roi;
  DateTime? lastUpdated;

  DataApi({
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.currentPrice,
    this.marketCap,
    this.marketCapRank,
    this.fullyDilutedValuation,
    this.totalVolume,
    this.high24H,
    this.low24H,
    this.priceChange24H,
    this.priceChangePercentage24H,
    this.marketCapChange24H,
    this.marketCapChangePercentage24H,
    this.circulatingSupply,
    this.totalSupply,
    this.maxSupply,
    this.ath,
    this.athChangePercentage,
    this.athDate,
    this.atl,
    this.atlChangePercentage,
    this.atlDate,
    this.roi,
    this.lastUpdated,
  });

  factory DataApi.fromJson(Map<String, dynamic> json) => DataApi(
    id: json["id"],
    symbol: json["symbol"],
    name: json["name"],
    image: json["image"],
    currentPrice: json["current_price"]?.toDouble(),
    marketCap: json["market_cap"]?.toDouble(),
    marketCapRank: json["market_cap_rank"]?.toDouble(),
    fullyDilutedValuation: json["fully_diluted_valuation"]?.toDouble(),
    totalVolume: json["total_volume"]?.toDouble(),
    high24H: json["high_24h"]?.toDouble(),
    low24H: json["low_24h"]?.toDouble(),
    priceChange24H: json["price_change_24h"]?.toDouble(),
    priceChangePercentage24H: json["price_change_percentage_24h"]?.toDouble(),
    marketCapChange24H: json["market_cap_change_24h"]?.toDouble(),
    marketCapChangePercentage24H:
        json["market_cap_change_percentage_24h"]?.toDouble(),
    circulatingSupply: json["circulating_supply"]?.toDouble(),
    totalSupply: json["total_supply"]?.toDouble(),
    maxSupply: json["max_supply"]?.toDouble(),
    ath: json["ath"]?.toDouble(),
    athChangePercentage: json["ath_change_percentage"]?.toDouble(),
    athDate: json["ath_date"] == null ? null : DateTime.parse(json["ath_date"]),
    atl: json["atl"]?.toDouble(),
    atlChangePercentage: json["atl_change_percentage"]?.toDouble(),
    atlDate: json["atl_date"] == null ? null : DateTime.parse(json["atl_date"]),
    roi: json["roi"] == null ? null : DataUser.fromJson(json["roi"]),
    lastUpdated:
        json["last_updated"] == null
            ? null
            : DateTime.parse(json["last_updated"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "symbol": symbol,
    "name": name,
    "image": image,
    "current_price": currentPrice,
    "market_cap": marketCap,
    "market_cap_rank": marketCapRank,
    "fully_diluted_valuation": fullyDilutedValuation,
    "total_volume": totalVolume,
    "high_24h": high24H,
    "low_24h": low24H,
    "price_change_24h": priceChange24H,
    "price_change_percentage_24h": priceChangePercentage24H,
    "market_cap_change_24h": marketCapChange24H,
    "market_cap_change_percentage_24h": marketCapChangePercentage24H,
    "circulating_supply": circulatingSupply,
    "total_supply": totalSupply,
    "max_supply": maxSupply,
    "ath": ath,
    "ath_change_percentage": athChangePercentage,
    "ath_date": athDate?.toIso8601String(),
    "atl": atl,
    "atl_change_percentage": atlChangePercentage,
    "atl_date": atlDate?.toIso8601String(),
    "roi": roi?.toJson(),
    "last_updated": lastUpdated?.toIso8601String(),
  };
}

class DataUser {
  double? times;
  Currency? currency;
  double? percentage;

  DataUser({this.times, this.currency, this.percentage});

  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
    times: json["times"]?.toDouble(),
    currency: currencyValues.map[json["currency"]]!,
    percentage: json["percentage"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "times": times,
    "currency": currencyValues.reverse[currency],
    "percentage": percentage,
  };
}

enum Currency { BTC, ETH, USD }

final currencyValues = EnumValues({
  "btc": Currency.BTC,
  "eth": Currency.ETH,
  "usd": Currency.USD,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
