import 'package:calculator/services/inbuilt_convertor_service.dart';
import 'package:calculator/ui/view/view.dart';
import 'package:flutter/material.dart';

class VolumePage extends StatelessWidget {
  const VolumePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Volume',
      data: InBuiltConvertor.getVolumeData(),
    );
  }
}
