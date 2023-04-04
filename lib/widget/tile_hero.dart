import 'package:flutter/material.dart';

import '../data/model/heroes_merge.dart';
import '../screens/hero_detail_page.dart';

class TileHero extends StatefulWidget {
  final HeroesMerge hero;
  final String imgAttr;
  final String roleNames;

  const TileHero({
    required this.hero, 
    required this.imgAttr,
    required this.roleNames
  });

  @override
  _TileHeroState createState() => _TileHeroState();
}

class _TileHeroState extends State<TileHero> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: _isSelected ? Container(
        height: 72,
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 72,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isSelected = !_isSelected;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                  ),
                  child: const Text('Radiant', style: TextStyle(color: Colors.black),),
                ),
              )
            ),
            Expanded(
              child: SizedBox(
                height: 72,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isSelected = !_isSelected;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                  ),
                  child: const Text('Dire', style: TextStyle(color: Colors.black),),
                ),
              )
            ),
          ],
        ),
      ) : ListTile(
        leading: Stack(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('https://api.opendota.com${widget.hero.img}'),
              radius: 30,
            ),
            Positioned(
              bottom: 0,
              right: 2,
              child: Image.network(widget.imgAttr,
                width: 15,
                height: 15,
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                  return Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        title: Text(widget.hero.localizedName),
        subtitle: Row(
          children: <Widget>[
            const Icon(Icons.local_offer, size: 15), // Add your icon here
            const SizedBox(width: 3), // Add some spacing between the icon and text
            Text(widget.roleNames)
          ],
        ),
        onTap: () => Navigator.pushNamed(
          context, 
          HeroDetailPage.routeName,
          arguments: widget.hero
        ),
        onLongPress: () {
          setState(() {
            _isSelected = !_isSelected;
          });
        },
        selected: _isSelected,
      ),
    );
  }
}