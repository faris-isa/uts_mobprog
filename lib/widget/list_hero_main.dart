import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_mobprog/provider/hero_provider.dart';

import '../data/model/heroes.dart';
import '../data/model/heroes_merge.dart';
import '../screens/hero_detail_page.dart';
import 'tile_hero.dart';


class ListHeroMain extends StatefulWidget {
  const ListHeroMain({Key? key}) : super(key:key);

  @override
  _ListHeroMainState createState() => _ListHeroMainState();
}

class _ListHeroMainState extends State<ListHeroMain> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    final List<HeroesMerge> heroes = 
      Provider.of<HeroesMergeProvider>(
        context,
        listen: false
      ).heroes;
    
    return ListView.builder(
      itemCount: heroes.length,
      itemBuilder: (context, index) {
        final hero = heroes[index];
        List<Role> roles = hero.roles;
        String roleNames = roles.map((role) => role.name).join(', ');
        final attr = hero.primaryAttr ;
        String imgAttr = 'https://static.wikia.nocookie.net/dota2_gamepedia/images/5/56/Intelligence_attribute_symbol.png';
        if (attr != null) {
          if (attr == PrimaryAttr.STR) {
            imgAttr = 'https://static.wikia.nocookie.net/dota2_gamepedia/images/7/7a/Strength_attribute_symbol.png';
          } else if (attr == PrimaryAttr.AGI) {
            imgAttr = 'https://static.wikia.nocookie.net/dota2_gamepedia/images/2/2d/Agility_attribute_symbol.png';
          }
        }
        return Card(
          child: TileHero(hero: hero, imgAttr: imgAttr, roleNames: roleNames)
        );
      },
    );
  }
}