import 'package:untitled/services/crypto_services/crypto_service.dart';
import 'package:untitled/services/crypto_services/crypto_service_interface.dart';
import 'package:untitled/modules/crypto/crypto_item_model.dart';

class CryptoViewModel {
  CryptoItemModel cryptoItemModel = CryptoItemModel(status: '', currency: '', convertTo: '', amount: 0, converted: 0);
  CryptoServiceInterface service = CryptoService();
  Future<CryptoItemModel> onUserTappedConvertButton({required cryptoItemModel}) async {
    try {
      cryptoItemModel = await service.fetchCurrency(cryptoItemModel: cryptoItemModel);
      return cryptoItemModel;
    } catch (e) {
      throw Exception();
    }
  }
}