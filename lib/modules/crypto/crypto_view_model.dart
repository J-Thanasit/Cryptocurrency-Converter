import 'package:untitled/services/crypto_services/crypto_service.dart';
import 'package:untitled/services/crypto_services/crypto_service_interface.dart';
import 'package:untitled/modules/crypto/crypto_item_model.dart';

class CryptoViewModel {
  Future<CryptoItemModel>? cryptoItemModel;
  CryptoServiceInterface service = CryptoService();
  Future<void> onUserTappedConvertButton({required String currency, required String convertTo, required double amount}) async {
    try {
      cryptoItemModel = service.fetchCurrency(currency: currency, convertTo: convertTo, amount: amount);
    } catch (e) {
      throw Exception();
    }
  }
}