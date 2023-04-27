import 'package:flutter/material.dart';
import 'package:untitled/services/crypto_services/crypto_service.dart';

class CryptoView extends StatefulWidget {
  const CryptoView({Key? key}) : super(key: key);

  @override
  State<CryptoView> createState() => _CryptoViewState();

}

class _CryptoViewState extends State<CryptoView> {

  // Controllers for the text input fields
  final currencyController = TextEditingController();
  final amountController = TextEditingController();
  final convertToController = TextEditingController();
  dynamic result;
  final _con = '';
  final _cur = '';
  final _amt = '';
  CryptoService currencyConverter = CryptoService();


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