import 'package:calculator/keyboards/keyboard.dart';
import 'package:calculator/widget/appdrawer.dart';
import 'package:flutter/material.dart';

class StandardCalculator extends StatefulWidget {
  const StandardCalculator({Key? key}) : super(key: key);

  @override
  State<StandardCalculator> createState() => _StandardCalculatorState();
}

class _StandardCalculatorState extends State<StandardCalculator> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  String _input = '';
  String _outputs = '';
  List _logs = [];
  bool zoomedInput = true;
  bool zoomedOutput = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Standard')),
      drawer: AppDrawer(),
      body: CustomScrollView(
        controller: _scrollController,
        // physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
              child: Container(
                  color: Colors.grey[200],
                  height: _logs.length <= 8
                      ? MediaQuery.of(context).size.height * 0.75
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
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700)),
                                      ))
                                  .toList()),
                        )
                      : const SizedBox.shrink())),
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _input != '' ? _input : '0',
                    style: zoomedInput
                        ? const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)
                        : TextStyle(),
                  ),
                  const SizedBox(height: 20),
                  Text(_outputs != '' ? '= ' + _outputs : '0',
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
                StdCalcBoard(
                  output: (output) {
                    setState(() {
                      _outputs = output;
                      // zoomedInput = false;
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
                      // zoomedInput = true;
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
