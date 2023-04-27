import 'package:untitled/services/crypto_services/crypto_service_interface.dart';
import 'package:untitled/modules/crypto/crypto_item_model.dart';


class CryptoMockService implements CryptoServiceInterface {
  @override
  Future<CryptoItemModel> fetchCurrency({required CryptoItemModel cryptoItemModel}) async {
    return CryptoItemModel(
      status: 'success',
      currency: "btc",
      convertTo: "thb",
      amount: 1,
      converted: 0.0,
    );
  }
}