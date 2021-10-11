import 'package:calculator/model/model.dart';
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
          const ListTile(
            dense: true,
            title: Text(
              'Converter',
              style:
                  TextStyle(fontSize: 18, decoration: TextDecoration.underline),
            ),
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
                itemCount: _screens.length,
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
          // ListTile(
          //   onTap: () {
          //     Navigator.of(context).pushReplacement(
          //       MaterialPageRoute(builder: (BuildContext context) {
          //         return const CurrencyPage();
          //       }),
          //     );
          //   },
          //   dense: true,
          //   leading: Icon(Icons.layers),
          //   title: Text('Currency'),
          // ),
          // const Divider(),
          // ListTile(
          //     onTap: () {
          //       Navigator.of(context).pushReplacement(
          //         MaterialPageRoute(builder: (BuildContext context) {
          //           return const VolumePage();
          //         }),
          //       );
          //     },
          //     dense: true,
          //     leading: Icon(Icons.view_in_ar_outlined),
          //     title: const Text('Volume')),
          // const Divider(),
          // ListTile(
          //   onTap: () {
          //     Navigator.of(context).pushReplacement(
          //       MaterialPageRoute(builder: (BuildContext context) {
          //         return const LengthPage();
          //       }),
          //     );
          //   },
          //   title: const Text('Lenght'),
          //   dense: true,
          //   leading: Icon(Icons.straighten),
          // ),
          // const Divider(),
          // TextButton(
          //     onPressed: () {
          //       Navigator.of(context).pushReplacement(
          //         MaterialPageRoute(builder: (BuildContext context) {
          //           return const WeightPage();
          //         }),
          //       );
          //     },
          //     child: const Text('Weight and Mass')),
          // const Divider(),
          // TextButton(
          //     onPressed: () {
          //       Navigator.of(context).pushReplacement(
          //         MaterialPageRoute(builder: (BuildContext context) {
          //           return const TemperaturePage();
          //         }),
          //       );
          //     },
          //     child: const Text('Temperature')),
          // const Divider(),
          // TextButton(
          //     onPressed: () {
          //       Navigator.of(context).pushReplacement(
          //         MaterialPageRoute(builder: (BuildContext context) {
          //           return const EnergyPage();
          //         }),
          //       );
          //     },
          //     child: const Text('Energy')),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.clear),
            title: const Text('Clear Data'),
            onTap: () {
              BaseModel.preferences!.clear();
            },
          )
        ],
      )),
    );
  }
}
