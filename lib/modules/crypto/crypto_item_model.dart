class CryptoItemModel {
  late String status;
  late String currency;
  late String convertTo;
  late double amount;
  late double converted;

  CryptoItemModel({
    required this.status,
    required this.currency,
    required this.convertTo,
    required this.amount,
    required this.converted,
  });

  CryptoItemModel.fromJson({required Map<String, dynamic> map}) {
    status = map['currency'];
    currency = map['currency'];
    convertTo = map['convertTo'];
    amount = map['amount'];
    converted = map['converted'];
  }
}