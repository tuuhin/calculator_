import 'package:calculator/model/model.dart';
import 'package:calculator/view/standardcalculator.dart';
import 'package:calculator/view/view.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({Key? key}) : super(key: key);

  final List<IconData> _screensIcon = [
    Icons.layers,
    Icons.view_in_ar_outlined,
    Icons.straighten,
    Icons.fitness_center_outlined,
    Icons.thermostat,
    Icons.local_fire_department
  ];
  final List _screens = [
    const CurrencyPage(),
    const VolumePage(),
    const LengthPage(),
    const WeightPage(),
    const TemperaturePage(),
    const EnergyPage(),
  ];
  final List<String> _screensHeading = [
    'Currency',
    'Volume',
    'Length',
    'Weights and Masses',
    'Temperature',
    'Energy'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
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
          const ListTile(title: Text('Convertors')),
          const Divider(),
          SizedBox(
            height: 300,
            child: ListView.builder(
                itemCount: _screens.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int i) {
                  return ListTile(
                    dense: true,
                    leading: Icon(_screensIcon[i]),
                    title: Text(_screensHeading[i]),
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (BuildContext context) {
                          return _screens[i];
                        }),
                      );
                    },
                  );
                }),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.clear),
            title: const Text('Clear Data'),
            dense: true,
            onTap: () {
              BaseModel.preferences!.clear();
            },
          ),
          const Divider(),
          const ListTile(
            dense: true,
            leading: Icon(Icons.info),
            title: Text('About'),
          )
        ],
      )),
    );
  }
}
