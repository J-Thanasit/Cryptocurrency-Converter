import 'package:flutter/material.dart';
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
  String? cur = '';
  String? con = '';
  double? amt = 0;

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
                Expanded(
                  child: FutureBuilder(
                    future: viewModel.cryptoItemModel,
                    builder: (context, snapshot) {
                      print(snapshot.connectionState);
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.connectionState == ConnectionState.done && snapshot.data != null) {
                        if(snapshot.data?.status == 'success'){
                          con = snapshot.data?.convertTo.toUpperCase();
                          cur = snapshot.data?.currency.toUpperCase();
                          amt = snapshot.data?.amount;
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '$amt $cur = ${snapshot.data?.converted} $con',
                              ),
                            ],
                          );
                        }else {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Currency invalid, please try again.',
                              ),
                            ],
                          );
                        }
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {viewModel.onUserTappedConvertButton(currency: currencyController.text,
                        convertTo: convertToController.text, amount: double.parse(amountController.text));
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