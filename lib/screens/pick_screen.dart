import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_mobprog/data/model/heroes.dart';

import '../data/model/heroes_merge.dart';
import '../provider/pick_provider.dart';



class PickScreen extends StatefulWidget {
  static const routeName = '/pick_hero';

  @override
  State<PickScreen> createState() => _PickScreenState();
}

class _PickScreenState extends State<PickScreen> {

  @override
  Widget build(BuildContext context) {
    final List<HeroesMerge> heroes = Provider.of<PickProvider>(
      context,
      listen: false
      ).direTeamPick;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Picked Hero"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.25,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.green[200]!
            ),
            child: Consumer<PickProvider>(
                    builder: (context, value, child) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder:(context, index) {
                          final radiant = value.radiantTeamPick[index];
                          return Row(
                            children: [
                              Stack(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage('https://api.opendota.com${radiant.img}'),
                                    radius: 30,
                                  ),
                                  Positioned(
                                    top: -15,
                                    right: -16,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: CircleBorder(),
                                        padding: EdgeInsets.all(0), // remove padding to control button size
                                        minimumSize: Size(12, 12), // set minimum size of the button
                                        backgroundColor: Colors.red,
                                      ),
                                      onPressed: () => value.deleteRadiant(radiant),
                                      child: Icon(Icons.close, size: 15,color: Colors.white),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          );
                        },
                        itemCount: value.radiantTeamPick.length,
                      );
                    },
                  )
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2.25,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.red[200]!
            ),
            child: 
              Consumer<PickProvider>(
                builder: (context, value, child) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder:(context, index) {
                      final dire = value.direTeamPick[index];
                      return Row(
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage('https://api.opendota.com${dire.img}'),
                                radius: 30,
                              ),
                              Positioned(
                                top: -15,
                                right: -16,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    padding: EdgeInsets.all(0), // remove padding to control button size
                                    minimumSize: Size(12, 12), // set minimum size of the button
                                    backgroundColor: Colors.red,
                                  ),
                                  onPressed: () => value.deleteDire(dire),
                                  child: Icon(Icons.close, size: 15,color: Colors.white),
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    },
                    itemCount: value.direTeamPick.length,
                  );
                },
              ),
          )
        ],

      ),
    );
  }
}