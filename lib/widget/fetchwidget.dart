import 'package:calculator/widget/updatedialog.dart';
import 'package:flutter/material.dart';

class FetchWidget extends StatelessWidget {
  const FetchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          'Rates  Not Found',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),
        const ListTile(
          leading: Icon(Icons.donut_large),
          title: Text('The rates used by are app are not present'),
          subtitle: Text(
              'While opening the app for the first time mobile data was nmto found so it failed to get the rates '),
        ),
        const Divider(),
        const ListTile(
          leading: Icon(Icons.donut_large),
          title: Text('Click the fetch button to get the rates'),
          subtitle: Text(
              'Make sure your internet is on the app is going to make a one time api call to get data'),
        ),
        const Divider(),
        const ListTile(
          leading: Icon(Icons.donut_large),
          title: Text('Restart the app After fetching data'),
          subtitle: Text(
              'You would prabably get a different screen.If not the data is not retrived .Plz follow the steps'),
        ),
        const Divider(),
        ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const UpdateDialog();
                });
          },
          child: const Text('Fetch Rates'),
          style: ElevatedButton.styleFrom(
            fixedSize: Size(MediaQuery.of(context).size.width, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ]),
    );
  }
}
