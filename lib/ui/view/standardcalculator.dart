import 'package:calculator/ui/keyboards/keyboard.dart';
import 'package:calculator/ui/widget/widget.dart';

import 'package:flutter/material.dart';

class StandardCalculator extends StatefulWidget {
  const StandardCalculator({Key? key}) : super(key: key);

  @override
  State<StandardCalculator> createState() => _StandardCalculatorState();
}

class _StandardCalculatorState extends State<StandardCalculator> {
  String _input = '';
  String _outputs = '';
  List _logs = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Standard')),
      drawer: AppDrawer(),
      body: CustomScrollView(
        controller: ScrollController(
            initialScrollOffset: MediaQuery.of(context).size.height),
        // physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
              child: Container(
                  color: Theme.of(context).cardColor,
                  height: _logs.length <= 8
                      ? MediaQuery.of(context).size.height * 0.72
                      : null,
                  child: _logs.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 20, right: 10),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: _logs
                                  .map((e) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Text('${e[0]}\n= ${e[1]}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6),
                                      ))
                                  .toList()),
                        )
                      : const SizedBox.shrink())),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(_input != '' ? _input : '0',
                      style: Theme.of(context).textTheme.headline5),
                  const SizedBox(height: 20),
                  Text(_outputs != '' ? '= ' + _outputs : '0',
                      style: Theme.of(context).textTheme.headline4),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const Divider(),
                StdCalcBoard(
                  output: (output) {
                    setState(() {
                      _outputs = output;
                    });
                  },
                  history: (logs) {
                    setState(() {
                      _logs = logs;
                    });
                  },
                  input: (input) {
                    setState(() {
                      _input = input;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
