import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_mobprog/data/model/heroes.dart';
import 'package:uts_mobprog/provider/pick_provider.dart';

import '../../data/model/heroes_merge.dart';

class CardHero extends StatefulWidget {
  final HeroesMerge hero;

  const CardHero({
    required this.hero, 
  });

  @override
  _CardHeroState createState() => _CardHeroState();
}

class _CardHeroState extends State<CardHero> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 3,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.hero.primaryAttr == PrimaryAttr.ALL 
              ? Colors.yellow[400]! 
                : widget.hero.primaryAttr == PrimaryAttr.STR 
                  ? Colors.red
                    : widget.hero.primaryAttr == PrimaryAttr.AGI 
                      ? Colors.green[400]!
                        : Colors.blue[600]! , 
            width: 4.0),
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            alignment: Alignment.center,
            image: NetworkImage('https://api.opendota.com${widget.hero.icon}')
          )
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              stops: const [0.1, 0.9],
              colors: widget.hero.primaryAttr == PrimaryAttr.ALL 
              ? [Colors.yellow[700]!.withOpacity(.9), Colors.yellow[200]!.withOpacity(.2) ] 
                : widget.hero.primaryAttr == PrimaryAttr.STR 
                  ? [Colors.red[800]!.withOpacity(.9), Colors.red[200]!.withOpacity(.2) ] 
                    : widget.hero.primaryAttr == PrimaryAttr.AGI 
                      ? [Colors.green[900]!.withOpacity(.9), Colors.green[200]!.withOpacity(.2) ] 
                        : [Colors.blue[900]!.withOpacity(.9), Colors.blue[200]!.withOpacity(.2) ] 
            )
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 6.0, bottom: 18.0),
              child: Text(
                widget.hero.localizedName, 
                style: TextStyle(
                  color: widget.hero.primaryAttr == PrimaryAttr.ALL ? Colors.black : Colors.white,
                  fontSize: 12
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
}