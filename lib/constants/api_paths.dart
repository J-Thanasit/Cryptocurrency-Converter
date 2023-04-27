class ApiPaths{
  String cryptoApi({required String currency, required String convertTo, required double amount}) {
    return ('https://api.coinconvert.net/convert/$currency/$convertTo?amount=$amount');
  }
}