import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_mobprog/data/model/heroes.dart';

import '../data/model/heroes_merge.dart';
import '../provider/pick_provider.dart';



class HeroDetailPage extends StatefulWidget {
  static const routeName = '/hero_detail';

  final HeroesMerge hero;

  const HeroDetailPage(this.hero);

  @override
  State<HeroDetailPage> createState() => _HeroDetailPageState();
}

class _HeroDetailPageState extends State<HeroDetailPage> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    String aliasesName = widget.hero.aliases.map((aliases) => aliases).join(', ');

    return Scaffold(
      // backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.hero.localizedName),
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.contacts, color: Colors.white), 
            onPressed:() {
              Navigator.pushNamed(context, '/pick_hero');
            }
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(bottom: 20),
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://api.opendota.com${widget.hero.img}'),
                      fit: BoxFit.cover
                    )
                  ),
                  child: Hero(
                    tag: widget.hero.name,
                    child: const SizedBox.shrink(),
                  ),
                ),
                Positioned(
                  bottom: -5,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: const BoxDecoration(
                      color: Colors.white
                    ),
                    child: Row (
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: (widget.hero.primaryAttr == PrimaryAttr.STR || widget.hero.primaryAttr == PrimaryAttr.ALL ) ? Colors.red[600]! : Colors.white,
                              width: 5.0,
                            ),
                            borderRadius: BorderRadius.circular(50)
                          ),
                          child: Image.network(
                            'https://static.wikia.nocookie.net/dota2_gamepedia/images/7/7a/Strength_attribute_symbol.png',
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text('${widget.hero.stat.strengthBase.toStringAsFixed(0)} + ${widget.hero.stat.strengthGain.toStringAsFixed(1)}', style: const TextStyle(fontSize: 18)),
                        const SizedBox(
                          width: 25,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: (widget.hero.primaryAttr == PrimaryAttr.AGI || widget.hero.primaryAttr == PrimaryAttr.ALL ) ? Colors.green : Colors.white,
                              width: 5.0,
                            ),
                            borderRadius: BorderRadius.circular(50)
                          ),
                          child: Image.network(
                            'https://static.wikia.nocookie.net/dota2_gamepedia/images/2/2d/Agility_attribute_symbol.png',
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text('${widget.hero.stat.agilityBase.toStringAsFixed(0)} + ${widget.hero.stat.agilityGain.toStringAsFixed(1)}', style: const TextStyle(fontSize: 18)),
                        const SizedBox(
                          width: 25,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: (widget.hero.primaryAttr == PrimaryAttr.INT || widget.hero.primaryAttr == PrimaryAttr.ALL ) ? Colors.blue[300]! : Colors.white,
                              width: 5.0,
                            ),
                            borderRadius: BorderRadius.circular(50)
                          ),
                          child: Image.network(
                            'https://static.wikia.nocookie.net/dota2_gamepedia/images/5/56/Intelligence_attribute_symbol.png',
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text('${widget.hero.stat.intelligenceBase.toStringAsFixed(0)} + ${widget.hero.stat.intelligenceGain.toStringAsFixed(1)}', style: const TextStyle(fontSize: 18))
                      ],
                    ),
                  )
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row (
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network('https://api.opendota.com${widget.hero.icon}'),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.hero.localizedName,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 10),
                        padding: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              offset: Offset(0, 5)
                            ),
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(-10, 0)
                            ),
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(10, 0)
                            ),
                          ]
                          ),
                        child: Text(
                          widget.hero.language.bio,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          decoration : const BoxDecoration(
                            color: Colors.black
                          ),
                          child: const Text("Biodata", style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Alias : $aliasesName',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Row(
                      children: [
                        Consumer<PickProvider>(
                          builder: (context, data, child) {
                            var isPicked = data.radiantTeamPick.contains(widget.hero);
                            var isDirePicked = data.direTeamPick.contains(widget.hero);
                            return ElevatedButton(
                              onPressed:  (data.radiantTeamPick.length < 5 && !isPicked && !isDirePicked) ? () {
                                setState(() {
                                  data.addRadiant(widget.hero);
                                  _isSelected = !_isSelected;
                                });
                              } : null,
                              style:  (data.radiantTeamPick.length < 5 && !isPicked && !isDirePicked)
                              ? ElevatedButton.styleFrom(
                                backgroundColor: Colors.greenAccent,
                                minimumSize: Size(175, 50)
                              ) 
                              : ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey,
                                minimumSize: Size(175, 50)
                              ), 
                              child: const Text('Radiant', style: TextStyle(color: Colors.black),),
                            );
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Consumer<PickProvider>(
                          builder: (context, data, child) {
                            var isPicked = data.direTeamPick.contains(widget.hero);
                            var isRadiantPicked = data.radiantTeamPick.contains(widget.hero);
                            return ElevatedButton(
                              onPressed: (data.direTeamPick.length < 5 && !isPicked && !isRadiantPicked) ? () {
                                setState(() {
                                  data.addDire(widget.hero);
                                  _isSelected = !_isSelected;
                                });
                              } : null,
                              style: (data.direTeamPick.length < 5 && !isPicked && !isRadiantPicked)
                              ? ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                                minimumSize: Size(175, 50)
                              ) 
                              : ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey,
                                minimumSize: Size(175, 50)
                              ), 
                              child: const Text('Dire', style: TextStyle(color: Colors.black),),
                            );
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}