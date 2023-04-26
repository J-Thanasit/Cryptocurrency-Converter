import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> convertCurrency(String currency, String convertTo, String amount) async {
  final url = Uri.parse("https://api.coinconvert.net/convert/$currency/$convertTo?amount=$amount");
  http.Response response = await http.get(url);

  if (response.statusCode == 200) {
    // Conversion was successful
    return json.decode(response.body);
  }else{
    return null;
  }
}
