import 'package:flutter/material.dart';
import 'package:untitled/modules/crypto/crypto_item_model.dart';
import 'package:untitled/modules/crypto/crypto_view_model.dart';

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
  final CryptoViewModel viewModel = CryptoViewModel();

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
                if(viewModel.cryptoItemModel.status != 'error')
                  Text('${viewModel.cryptoItemModel.converted}'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    viewModel.cryptoItemModel.currency = currencyController.text;
                    viewModel.cryptoItemModel.convertTo = convertToController.text;
                    viewModel.cryptoItemModel.amount = double.parse(amountController.text);
                    bool success = await viewModel.onUserTappedConvertButton(cryptoItemModel: viewModel.cryptoItemModel);
                    if(success) {
                      setState(() {});
                    }
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