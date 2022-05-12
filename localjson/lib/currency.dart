// ignore_for_file: prefer_typing_uninitialized_variables

class Currency {
  var base;
  var quote;
  var type;
  var lastPrice;
  var volume;

  Currency({
    this.base,
    this.quote,
    this.type,
    this.lastPrice,
    this.volume,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      base: json['base'] ?? "",
      quote: json['quote'] ?? "",
      type: json['type'] ?? "",
      lastPrice: json['lastPrice'] ?? 0.000,
      volume: json['volume'] ?? 0.000,
    );
  }

  Map<String, dynamic> toJson() => {
        "base": base,
        "quote": quote,
        "type": type,
        "lastPrice": lastPrice,
        "volume": volume,
      };
}
