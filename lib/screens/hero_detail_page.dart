import 'package:flutter/material.dart';
import 'package:html/parser.dart';

import '../data/model/heroes_merge.dart';



class HeroDetailPage extends StatelessWidget {
  static const routeName = '/hero_detail';

  final HeroesMerge hero;

  const HeroDetailPage(this.hero);

  @override
  Widget build(BuildContext context) {
    String aliasesName = hero.aliases.map((aliases) => aliases).join(', ');

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(hero.localizedName),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://api.opendota.com${hero.img}'),
                  fit: BoxFit.cover
                )
              ),
              child: Hero(
                tag: hero.name,
                child: const SizedBox.shrink(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row (
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network('https://api.opendota.com${hero.icon}'),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        hero.localizedName,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row (
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://static.wikia.nocookie.net/dota2_gamepedia/images/7/7a/Strength_attribute_symbol.png',
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text('${hero.stat.strengthBase.toStringAsFixed(0)} + ${hero.stat.strengthGain.toStringAsFixed(1)}'),
                      const SizedBox(
                        width: 25,
                      ),
                      Image.network(
                        'https://static.wikia.nocookie.net/dota2_gamepedia/images/2/2d/Agility_attribute_symbol.png',
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text('${hero.stat.agilityBase.toStringAsFixed(0)} + ${hero.stat.agilityGain.toStringAsFixed(1)}'),
                      const SizedBox(
                        width: 25,
                      ),
                      Image.network(
                        'https://static.wikia.nocookie.net/dota2_gamepedia/images/5/56/Intelligence_attribute_symbol.png',
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text('${hero.stat.intelligenceBase.toStringAsFixed(0)} + ${hero.stat.intelligenceGain.toStringAsFixed(1)}')
                    ],
                  ),
                  const Divider(color: Colors.grey),
                  Text(
                    hero.language.bio,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  const Divider(color: Colors.grey),
                  Text(
                    'Alias : $aliasesName',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}