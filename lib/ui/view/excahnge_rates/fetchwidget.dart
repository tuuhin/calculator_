import 'package:calculator/ui/view/excahnge_rates/updatedialog.dart';
import 'package:flutter/material.dart';

class FetchWidget extends StatelessWidget {
  const FetchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Image.asset('assets/exchange.png', scale: 2),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const ListTile(
              title: Text('Exchange Rates'),
              subtitle: Text(
                  'The rates are  not added to the database ,fetch it to add'),
            ),
            const SizedBox(height: 20),
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
          ],
        ),
      ),
    ]);
  }
}
