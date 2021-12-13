import 'package:calculator/data/local/currency_hive_database.dart';
import 'package:provider/provider.dart';
import 'package:calculator/services/currency_service.dart';
import 'package:flutter/material.dart';

class UpdateDialog extends StatefulWidget {
  const UpdateDialog({Key? key}) : super(key: key);

  @override
  State<UpdateDialog> createState() => _UpdateDialogState();
}

class _UpdateDialogState extends State<UpdateDialog> {
  late bool _started;

  @override
  void initState() {
    super.initState();
    _started = false;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(!_started ? 'Fetch Rates' : 'Fetching',
          style: Theme.of(context).textTheme.headline5),
      actions: !_started
          ? [
              TextButton(
                  onPressed: () async {
                    setState(() {
                      _started = !_started;
                    });

                    bool? res = await CurrencyHiveDatabase.createCurrencyBox();

                    if (res == true) {
                      Provider.of<CurrencyData>(context, listen: false)
                          .checkEntryExists();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Rates Added Successfully')));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Rates Failed To Add')));
                    }
                    Navigator.of(context).pop();
                  },
                  child: const Text('Fetch'))
            ]
          : [],
      content: Text(
        !_started
            ? 'Click  to fetch the rates ,this process recuires the mobiule data so make sure it\'s turned on'
            : 'Fetching the rates ..',
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
