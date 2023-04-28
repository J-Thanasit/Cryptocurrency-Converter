import 'package:untitled/services/crypto_services/crypto_service.dart';
import 'package:untitled/services/crypto_services/crypto_service_interface.dart';
import 'package:untitled/modules/crypto/crypto_item_model.dart';

class CryptoViewModel {
  Future<CryptoItemModel>? cryptoItemModel;
  CryptoServiceInterface service = CryptoService();
  Future<bool> onUserTappedConvertButton({required cryptoItemModel}) async {
    try {
      cryptoItemModel = await service.fetchCurrency(cryptoItemModel: cryptoItemModel);
      return true;
    } catch (e) {
      return false;
    }
  }
}