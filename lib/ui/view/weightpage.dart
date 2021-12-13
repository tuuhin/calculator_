import 'package:calculator/services/inbuilt_convertor_service.dart';
import 'package:calculator/ui/view/view.dart';

import 'package:flutter/material.dart';

class WeightPage extends StatelessWidget {
  const WeightPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Weights and Masses',
      data: InBuiltConvertor.getWeightsData(),
    );
  }
}
