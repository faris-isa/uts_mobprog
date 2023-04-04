import 'package:flutter/material.dart';
import 'package:html/parser.dart';

import '../data/model/heroes_merge.dart';



class HeroDetailPage extends StatelessWidget {
  static const routeName = '/hero_detail';

  final HeroesMerge hero;

  const HeroDetailPage(this.hero);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hero.localizedName),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Hero(
                    tag: hero.name,
                    child: Image.network('https://api.opendota.com${hero.img}'),
                  ),
                ),
                Expanded(
                  child: Container(

                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hero.localizedName,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  const Divider(color: Colors.grey),
                  Text(
                    hero.language.bio,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Divider(color: Colors.grey),
                  Text(
                    'Date: ${hero.localizedName}',
                    style: Theme.of(context).textTheme.caption,
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