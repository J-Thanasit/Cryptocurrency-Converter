import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled/constants/api_paths.dart';
import 'package:untitled/modules/crypto/crypto_item_model.dart';
import 'package:untitled/services/crypto_services/crypto_service_interface.dart';

class CryptoService implements CryptoServiceInterface {
  @override
  Future<CryptoItemModel> fetchCurrency({required String currency, required String convertTo, required double amount}) async {
    ApiPaths api = ApiPaths();
    final String converter = api.cryptoApi(currency: currency,
        convertTo: convertTo,
        amount: amount);
    final url = Uri.parse(converter);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> curList = json.decode(response.body);
      double converted = curList[convertTo.toUpperCase()];
      String status = curList['status'];
      return CryptoItemModel(status: status, currency: currency, convertTo: convertTo, amount: amount, converted: converted);
    }
    throw Exception();
  }
}

