import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled/constants/api_paths.dart';
import 'package:untitled/modules/crypto/crypto_item_model.dart';
import 'package:untitled/services/crypto_services/crypto_service_interface.dart';

class CryptoService implements CryptoServiceInterface {
  Future<CryptoItemModel> fetchCurrency(
      {required CryptoItemModel cryptoItemModel}) async {
    try {
      ApiPaths api = ApiPaths();
      final String converter = api.cryptoApi(currency: cryptoItemModel.currency,
          convertTo: cryptoItemModel.convertTo,
          amount: cryptoItemModel.amount);
      final url = Uri.parse(converter);
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> curList = json.decode(response.body);
        cryptoItemModel.converted = curList[cryptoItemModel.convertTo];
        return cryptoItemModel;
      }
    } catch (e) {
      throw Exception();
    }
    throw Exception();
  }
}

