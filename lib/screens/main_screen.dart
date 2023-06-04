import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_mobprog/provider/hero_provider.dart';

import '../data/model/heroes.dart';
import '../data/model/heroes_merge.dart';
import 'components/card_hero.dart';


class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);
  
  static const routeName = '/';

  @override
  _MainScreenState createState() => _MainScreenState();
  
}

class _MainScreenState extends State<MainScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final List<HeroesMerge> heroes = 
      Provider.of<HeroesMergeProvider>(
        context,
        listen: false
      ).heroes;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dota 2 Heroes'),
        backgroundColor: Colors.black
      ),
    );
  }
}

