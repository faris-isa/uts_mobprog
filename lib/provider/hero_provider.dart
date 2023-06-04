import 'package:flutter/foundation.dart';
import 'package:uts_mobprog/file_manager.dart';

import '../data/model/heroes.dart';
import '../data/model/heroes_merge.dart';



class HeroesMergeProvider extends ChangeNotifier {
  List<HeroesMerge> _heroes = [];
  List<HeroesMerge> _heroesFiltered = [];

  List<HeroesMerge> get heroes => _heroes;

  List<HeroesMerge> get heroesFiltered => _heroesFiltered;

  readHeroes() async {
    final result = await FileManager().readFile();

    if (result != null) {
      final heroesList = result.map((json) => HeroesMerge.fromJson(json)).toList();
      _heroes = heroesList;
      _heroesFiltered = heroesList;
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

  filteredHeroes(attribut) {
    _heroesFiltered = _heroes.where((obj) => obj.primaryAttr == attribut).toList();
    notifyListeners();
  }

  filterNameHeroes(String name, String attribut) {
    _heroesFiltered = _heroes.where((hero) => hero.localizedName.toLowerCase().contains(name.toLowerCase())).toList();
    if(attribut == "ALL") {
      _heroesFiltered = _heroesFiltered.where((obj) => obj.primaryAttr == PrimaryAttr.ALL).toList();
    } else if (attribut == "STR") {
      _heroesFiltered = _heroesFiltered.where((obj) => obj.primaryAttr == PrimaryAttr.STR).toList();
    } else if (attribut == "AGI") {
      _heroesFiltered = _heroesFiltered.where((obj) => obj.primaryAttr == PrimaryAttr.AGI).toList();
    } else if (attribut == "INT") {
      _heroesFiltered = _heroesFiltered.where((obj) => obj.primaryAttr == PrimaryAttr.INT).toList();
    }
    notifyListeners();
  }


}