import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product/view/product_view.dart';
import 'product/view_model/home_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ListenableProvider(
          create: (_) => HomeViewModel(),
          child: const ProductView(title: 'Flutter Demo Home Page'),
        ),
      );
}
