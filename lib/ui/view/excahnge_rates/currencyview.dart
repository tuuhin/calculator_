import 'package:calculator/data/local/currency_hive_database.dart';
import 'package:calculator/services/currency_service.dart';
import 'package:calculator/ui/drawer/appdrawer.dart';
import 'package:calculator/ui/view/excahnge_rates/currencypage.dart';
import 'package:calculator/ui/view/excahnge_rates/fetchwidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencyPage extends StatelessWidget {
  const CurrencyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _normal = Provider.of<CurrencyData>(context).success;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency'),
        actions: _normal
            ? [
                IconButton(
                    tooltip: 'Update',
                    onPressed: () async {
                      bool? updated = await CurrencyHiveDatabase.updateRates();
                      if (updated == true) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Rates updated successfully')));
                      }
                    },
                    icon: const Icon(Icons.update)),
                IconButton(
                    tooltip: 'Clear',
                    onPressed: () async {
                      await CurrencyHiveDatabase.clear();
                      Provider.of<CurrencyData>(context, listen: false)
                          .checkEntryExists();
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Rates Cleared')));
                    },
                    icon: const Icon(Icons.clear))
              ]
            : [],
      ),
      drawer: AppDrawer(),
      body: _normal
          ? CurrencyPageView(
              exchangeRates: CurrencyHiveDatabase.exchangerates())
          : const FetchWidget(),
    );
  }
}
