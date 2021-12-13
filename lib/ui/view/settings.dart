import 'package:calculator/ui/widget/widget.dart';
import 'package:calculator/utils/themeprovider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final _theme = Provider.of<ThemeProvider>(context);

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Features', style: Theme.of(context).textTheme.headline5),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.calculate),
              title: Text('Calculator'),
              isThreeLine: true,
              subtitle: Text(
                  'Containes a single calculator which lets you to do basic calculations'),
            ),
            const ListTile(
              leading: Icon(Icons.change_circle),
              title: Text('Converter'),
              isThreeLine: true,
              subtitle: Text(
                  'Contains various convertors helps with your basic conversions'),
            ),
            Text('Settings', style: Theme.of(context).textTheme.headline5),
            const Divider(),
            ListTile(
              trailing: Switch(
                  value: _theme.themeisDark,
                  onChanged: (bool changes) {
                    _theme.changeTheme(changes);
                  }),
              leading:
                  Icon(!_theme.themeisDark ? Icons.dark_mode : Icons.light),
              title: Text(!_theme.themeisDark ? 'Dark Theme' : 'Light Theme'),
              subtitle: Text('Change the theme ' +
                  (!_theme.themeisDark ? 'dark mode' : 'light mode')),
            ),
          ],
        ),
      ),
    );
  }
}
