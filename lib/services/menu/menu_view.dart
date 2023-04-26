import 'package:flutter/material.dart';
import 'package:untitled/services/crypto_services/crypto_service.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();

}

class _MenuViewState extends State<MenuView> {

  // Controllers for the text input fields
  final currencyController = TextEditingController();
  final amountController = TextEditingController();
  final convertToController = TextEditingController();
  dynamic result;
  var _con = '';
  var _cur = '';
  var _amt = '';


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScaffoldMessenger(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Crypto Currency Converter'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Type in the currency to convert',
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: currencyController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Cryptocurrency',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: convertToController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Convert to',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: amountController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Amount',
                  ),
                ),
                const SizedBox(height: 16),
                if(result != null)
                  Text(
                      '$_amt $_cur = $result $_con'
                  ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    final res = await convertCurrency(currencyController.text, convertToController.text, amountController.text);
                    if (res != null) {
                      result = res[convertToController.text.toUpperCase()];
                      _con = convertToController.text.toUpperCase();
                      _cur = currencyController.text.toUpperCase();
                      _amt = amountController.text;
                    }else {
                      result = "Incorrect currency, please try again.";
                      _con = "";
                      _cur = "";
                      _amt = "";

                    }
                    setState(() {});
                    },

                  child: const Text('Convert'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}