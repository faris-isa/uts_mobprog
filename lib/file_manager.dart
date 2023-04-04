import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uts_mobprog/data/model/heroes.dart';
import 'package:uts_mobprog/data/model/heroes_detailed.dart';
import 'package:uts_mobprog/data/model/heroes_merge.dart';

import 'data/api/api_service.dart';

class FileManager {
  static FileManager? _instance;
  String fileName = 'data.json';

  FileManager._internal() {
    _instance = this;
  }

  factory FileManager() => _instance ?? FileManager._internal();

  Future<String> get _directoryPath async {
    Directory directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _file async {
    final path = await _directoryPath;
    return File('$path/$fileName');
  }

  Future<List<dynamic>?> readFile() async {
    final file = await _file;
    var jsonList = [];
    if (await file.exists()){
      final jsonString = await file.readAsString();
      jsonList = json.decode(jsonString) as List<dynamic>;
    }
    
    return jsonList;
  }

  Future<void> writeFile() async {
    final heroesPic = await ApiService().getPicture();
    final heroesData = await ApiService().getAllData();
    // final heroesPicJson = heroesToJson(heroesPic);
    // final heroesDataJson = heroesDetailedToJson(heroesData);
    List<HeroesMerge> mergedHeroes = [];

    for (int i = 0; i < heroesPic.length; i++) {
      Heroes item1 = heroesPic[i];
      HeroesDetailed item2 = heroesData.firstWhere((item) => item.name == item1.name);
      // ignore: unnecessary_null_comparison
      if (item2 != null) {
        mergedHeroes.add(HeroesMerge(
          id: item1.id, 
          name: item1.name, 
          localizedName: item1.localizedName, 
          primaryAttr: item1.primaryAttr, 
          attackType: item1.attackType, 
          roles: item1.roles, 
          img: item1.img, 
          icon: item1.icon, 
          baseHealth: item1.baseHealth, 
          baseMana: item1.baseMana, 
          abilities: item2.abilities, 
          talents: item2.talents, 
          stat: item2.stat, 
          language: item2.language, 
          aliases: item2.aliases
        ));
      }
    }

    final file = await _file;
    await file.writeAsString(heroesMergeToJson(mergedHeroes));
  }

  deleteFile() async {
    final file = await _file;
    if (await file.exists()) {
      await file.delete();
    }
  }
  
}