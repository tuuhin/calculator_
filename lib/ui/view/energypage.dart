import 'package:calculator/services/inbuilt_convertor_service.dart';
import 'package:calculator/ui/view/view.dart';

import 'package:flutter/material.dart';

class EnergyPage extends StatelessWidget {
  const EnergyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Energy',
      data: InBuiltConvertor.getEnergyData(),
    );
  }
}
