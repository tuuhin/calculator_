import 'package:calculator/model/currencymodel.dart';
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
      title: Text(!_started ? 'Update Rates' : 'Updating'),
      actions: !_started
          ? [
              TextButton(
                  onPressed: () async {
                    setState(() {
                      _started = true;
                    });
                    await CurrencyModel().fetchData();
                    await Future.delayed(const Duration(seconds: 1));
                    setState(() {
                      _started = false;
                    });
                    // Navigator.of(context).pop();
                  },
                  child: const Text('Update'))
            ]
          : [],
      content: Text(!_started
          ? 'Click Update to update the rates ,this process recuires the mobiule data so make sure it\'s turned on'
          : 'Updating the rates of the currency conversion..'),
    );
  }
}
