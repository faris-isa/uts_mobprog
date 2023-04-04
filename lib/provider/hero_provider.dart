import 'package:flutter/foundation.dart';
import 'package:uts_mobprog/file_manager.dart';

import '../data/model/heroes_merge.dart';



class HeroesMergeProvider extends ChangeNotifier {
  List<HeroesMerge> _heroes = [];

  List<HeroesMerge> get heroes => _heroes;

  readHeroes() async {
    final result = await FileManager().readFile();

    if (result != null) {
      final heroesList = result.map((json) => HeroesMerge.fromJson(json)).toList();
      _heroes = heroesList;
    }
    notifyListeners();
  }

  writeHeroes() async {
    await FileManager().writeFile();
    readHeroes();
    notifyListeners();
  }

  deleteHeroes() async {
    await FileManager().deleteFile();
    readHeroes();
    notifyListeners();
  }

}