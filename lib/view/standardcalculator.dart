import 'package:calculator/keyboards/keyboard.dart';
import 'package:calculator/widget/appdrawer.dart';
import 'package:flutter/material.dart';

class StandardCalculator extends StatefulWidget {
  const StandardCalculator({Key? key}) : super(key: key);

  @override
  State<StandardCalculator> createState() => _StandardCalculatorState();
}

class _StandardCalculatorState extends State<StandardCalculator> {
  String _caltext = '';
  String _expresion = '';
  // List _history = [];

  late ScrollController _scrollController;
  String removeZero(String str) {
    if (str.startsWith('0') && str.length > 1) {
      return str.substring(1);
    } else {
      return str;
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      print(_scrollController.offset);
    });
    return Scaffold(
      appBar: AppBar(title: const Text('std calculator')),
      drawer: AppDrawer(),
      body: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
              child: Container(
            color: Colors.purple,
            height: MediaQuery.of(context).size.height * 0.75,
          )),
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    removeZero(_caltext),
                  ),
                  const SizedBox(height: 20),
                  Text('= ' + removeZero(_expresion),
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const Divider(),
                StdCalcBoard(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
