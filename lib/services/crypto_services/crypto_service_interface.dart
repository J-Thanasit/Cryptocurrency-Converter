import 'package:untitled/modules/crypto/crypto_item_model.dart';

abstract class CryptoServiceInterface{
  Future<CryptoItemModel> fetchCurrency({
    required CryptoItemModel cryptoItemModel
  });
}