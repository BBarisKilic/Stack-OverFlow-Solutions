import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/enums.dart';

class MyCheckBox extends StatelessWidget {
  const MyCheckBox({
    Key? key,
    required this.savedFruits,
    required this.onChanged,
  }) : super(key: key);

  final List<String> savedFruits;
  final void Function(bool? value, Meyveler meyve) onChanged;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          for (var meyve in Meyveler.values) check(meyve),
        ],
      );

  CheckboxListTile check(Meyveler meyve) => CheckboxListTile(
        title: Text(meyve.name),
        value: savedFruits.contains(describeEnum(meyve)),
        onChanged: (value) => onChanged(value, meyve),
      );
}
