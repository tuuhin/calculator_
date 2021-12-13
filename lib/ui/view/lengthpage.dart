import 'package:calculator/services/inbuilt_convertor_service.dart';
import 'package:calculator/ui/view/view.dart';
import 'package:flutter/material.dart';

class LengthPage extends StatelessWidget {
  const LengthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Lenght',
      data: InBuiltConvertor.getLengthData(),
    );
  }
}
