import 'package:flutter/material.dart';

import '../models/enums.dart';

class MyRadio extends StatelessWidget {
  const MyRadio({
    Key? key,
    required this.currentSinger,
    required this.onChanged,
  }) : super(key: key);

  final Singers currentSinger;
  final void Function(Singers singer) onChanged;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          for (var singer in Singers.values) _radio(singer),
        ],
      );

  RadioListTile<Singers> _radio(Singers singer) => RadioListTile(
        title: Text(singer.name),
        value: singer,
        groupValue: currentSinger,
        onChanged: (_) => onChanged(singer),
      );
}
