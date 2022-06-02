import 'package:shared_preferences/shared_preferences.dart';

import '../models/enums.dart';
import '../models/my_varibles.dart';

class Helper {
  Future<void> verileriKaydet(MyVariables variables) async {
    final prefs = await SharedPreferences.getInstance();
    prefs
      ..setString('name', variables.name)
      ..setInt('singer', variables.singer.index)
      ..setStringList('fruitList', variables.fruitList);
  }

  Future<MyVariables> verileriOku() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('name') ?? '';
    final Singers singer = Singers.values[(prefs.getInt('singer') ?? 0)];
    final List<String> fruitList = prefs.getStringList('fruitList') ?? [];

    return MyVariables(name, singer, fruitList);
  }
}
