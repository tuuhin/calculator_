import 'package:calculator/ui/view/excahnge_rates/currencyview.dart';
import 'package:calculator/ui/view/view.dart';
import 'package:calculator/ui/theme/themeprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({Key? key}) : super(key: key);

  final List<IconData> _screensIcon = [
    Icons.layers,
    Icons.view_in_ar_outlined,
    Icons.straighten,
    Icons.fitness_center_outlined,
    Icons.thermostat,
    Icons.local_fire_department,
    Icons.bolt,
    Icons.compress,
    Icons.schedule,
    Icons.power,
  ];
  final List<Widget> _screens = [
    const CurrencyPage(),
    const VolumePage(),
    const LengthPage(),
    const WeightPage(),
    const TemperaturePage(),
    const EnergyPage(),
    const SpeedPage(),
    const PressurePage(),
    const TimePage(),
    const PowerPage(),
  ];
  final List<String> _screensHeading = [
    'Currency',
    'Volume',
    'Length',
    'Weights and Masses',
    'Temperature',
    'Energy',
    'Speed',
    'Pressure',
    'Time',
    'Power'
  ];
  @override
  Widget build(BuildContext context) {
    final _theme = Provider.of<ThemeProvider>(context);
    return Drawer(
        child: ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const SizedBox(height: 30),
        ListTile(
            dense: true,
            onTap: () {
              Navigator.pop(context);
            },
            leading: const Icon(
              Icons.menu,
            )),
        const ListTile(title: Text('Calculators')),
        const Divider(),
        ListTile(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (BuildContext context) {
                return const StandardCalculator();
              }),
            );
          },
          leading: const Icon(Icons.calculate),
          dense: true,
          title: const Text(
            'Standard',
          ),
        ),
        // SliverToBoxAdapter(
        //   child: ListTile(
        //     onTap: () {
        //       Navigator.of(context).pushReplacement(
        //         MaterialPageRoute(builder: (BuildContext context) {
        //           return const ScientificCalculator();
        //         }),
        //       );
        //     },
        //     leading: const Icon(Icons.science),
        //     dense: true,
        //     title: const Text(
        //       'Scientific',
        //     ),
        //   ),
        // ),
        const ListTile(title: Text('Convertors')),
        const Divider(),
        SizedBox(
          // height: MediaQuery.of(context).size.height * 0.45,
          child: Column(
            children: _screens
                .asMap()
                .map(
                  (int key, Widget value) => MapEntry(
                    key,
                    ListTile(
                      dense: true,
                      leading: Icon(_screensIcon[key]),
                      title: Text(_screensHeading[key]),
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (BuildContext context) {
                            return _screens[key];
                          }),
                        );
                      },
                    ),
                  ),
                )
                .values
                .toList(),
          ),
        ),
        const Divider(),
        ListTile(
          dense: true,
          trailing: Switch(
              value: _theme.themeisDark,
              onChanged: (bool changes) {
                _theme.changeTheme(changes);
              }),
          leading: Icon(!_theme.themeisDark ? Icons.dark_mode : Icons.light),
          title: Text(!_theme.themeisDark ? 'Dark Theme' : 'Light Theme'),
        ),
      ],
    ));
  }
}
