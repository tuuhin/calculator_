import 'package:calculator/services/inbuilt_convertor_service.dart';
import 'package:calculator/ui/view/view.dart';
import 'package:flutter/material.dart';

class SpeedPage extends StatelessWidget {
  const SpeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Speed',
      data: InBuiltConvertor.getSpeedData(),
    );
  }
}
