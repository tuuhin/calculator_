import 'package:calculator/services/inbuilt_convertor_service.dart';
import 'package:calculator/ui/view/view.dart';

import 'package:flutter/material.dart';

class PowerPage extends StatelessWidget {
  const PowerPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Power',
      data: InBuiltConvertor.getPowerData(),
    );
  }
}
