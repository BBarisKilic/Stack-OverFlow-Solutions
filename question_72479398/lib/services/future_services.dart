import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/enums.dart';
import '../models/my_varibles.dart';

class FutureServices {
  Future<void> verileriKaydet(MyVariables myInformations) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: 'isim', value: myInformations.name);
    await storage.write(
      key: 'cinsiyet',
      value: myInformations.singer.index.toString(),
    );
    await storage.write(
      key: 'liste',
      value: jsonEncode(myInformations.fruitList),
    );
  }

  Future<MyVariables> verileriOku() async {
    const storage = FlutterSecureStorage();
    final isim = await storage.read(key: 'isim') ?? ' ';
    final cinsiyetValue = await storage.read(key: 'cinsiyet') ?? '0';
    final Singers singo = Singers.values[int.parse(cinsiyetValue)];
    final liste = await storage.read(key: 'liste');
    final myList =
        liste == null ? <String>[] : List<String>.from(jsonDecode(liste));

    return MyVariables(isim, singo, myList);
  }
}
