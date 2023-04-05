import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../data/model/heroes_merge.dart';

class PickProvider extends ChangeNotifier{
  final List<HeroesMerge> _radiantTeamPick = [];
  final List<HeroesMerge> _direTeamPick = [];

  List<HeroesMerge> get radiantTeamPick => _radiantTeamPick;
  List<HeroesMerge> get direTeamPick => _direTeamPick;

  void pickedRadiant(HeroesMerge hero, bool isPicked){
    isPicked ? _radiantTeamPick.add(hero) : _radiantTeamPick.remove(hero);
    notifyListeners();
  }

  void addRadiant(HeroesMerge hero) {
    _radiantTeamPick.add(hero);
    notifyListeners();
  }

  void deleteRadiant(HeroesMerge hero) {
    _radiantTeamPick.remove(hero);
    notifyListeners();
  }

  void pickedDire(HeroesMerge hero, bool isPicked){
    isPicked ? _direTeamPick.add(hero) : _direTeamPick.remove(hero);
    notifyListeners();
  }

  void addDire(HeroesMerge hero) {
    _direTeamPick.add(hero);
    notifyListeners();
  }

  void deleteDire(HeroesMerge hero) {
    _direTeamPick.remove(hero);
    notifyListeners();
  }
}