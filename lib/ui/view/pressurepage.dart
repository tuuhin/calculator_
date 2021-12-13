import 'package:calculator/services/inbuilt_convertor_service.dart';
import 'package:calculator/ui/view/view.dart';
import 'package:flutter/material.dart';

class PressurePage extends StatelessWidget {
  const PressurePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Pressure',
      data: InBuiltConvertor.getPressureData(),
    );
  }
}
