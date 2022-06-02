import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/enums.dart';
import '../models/my_varibles.dart';
import '../services/future_services.dart';
import '../services/helper.dart';
import '../widgets/my_check_box.dart';
import '../widgets/my_radio.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  List<String> fruits = [];
  Helper myHelper = Helper();
  FutureServices future = FutureServices();
  Singers currentSinger = Singers.Ianis;

  @override
  initState() {
    super.initState();
    verileriOku1();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Storage App')),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _controller,
                decoration: const InputDecoration(hintText: 'İsim Giriniz'),
              ),
            ),
            MyRadio(
              currentSinger: currentSinger,
              onChanged: (singer) {
                setState(() => currentSinger = singer);
              },
            ),
            MyCheckBox(
              savedFruits: fruits,
              onChanged: (value, meyve) {
                setState(() {
                  if (value == true) {
                    fruits.add(describeEnum(meyve));
                  } else {
                    fruits.remove(describeEnum(meyve));
                  }
                });
              },
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Yazdır'),
            ),
            TextButton(
              onPressed: () {
                final object =
                    MyVariables(_controller.text, currentSinger, fruits);
                myHelper.verileriKaydet(object);
              },
              child: const Text('Kaydet'),
            ),
          ],
        ),
      );

  Future<void> verileriOku1() async {
    final info = await myHelper.verileriOku();

    setState(() {
      _controller.text = info.name;
      fruits = info.fruitList;
      currentSinger = info.singer;
    });
  }
}
