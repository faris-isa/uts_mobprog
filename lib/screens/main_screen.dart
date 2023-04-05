import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_mobprog/provider/hero_provider.dart';
import 'package:uts_mobprog/provider/pick_provider.dart';
import 'package:uts_mobprog/widget/list_hero_main.dart';

import '../data/model/heroes_merge.dart';


class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
  
}

class _MainScreenState extends State<MainScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    // final List<HeroesMerge> radiantTeamPick = 
    // Provider.of<PickProvider>(
    //   context,
    //   listen: false
    // ).radiantTeamPick;

    // final List<HeroesMerge> direTeamPick = 
    // Provider.of<PickProvider>(
    //   context,
    //   listen: false
    // ).direTeamPick;
    

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dota 2 Heroes'),
        backgroundColor: Colors.black
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.green[100],
                        child: SizedBox(
                          height: 100,
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
                        )
                      )
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.red[100],
                        child: SizedBox(
                          height: 100,
                          child: Consumer<PickProvider>(
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
                          )
                        )
                      )
                    ),
                  ],
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: context.select(
                (HeroesMergeProvider data) => data.heroes.isEmpty
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      textStyle: const TextStyle(fontSize: 18),
                      minimumSize: const Size.fromHeight(48)
                    ),
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await context.read<HeroesMergeProvider>().writeHeroes();
                      setState(() {
                        isLoading = false;
                      });
                    },
                    child: isLoading 
                    ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        SizedBox(
                          height: 12,
                          width: 12,
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
                        SizedBox(width: 20),
                        Text('Please Wait ...')
                      ],
                    )   : const Text("Get Data Heroes")
                    // child: 
                  )
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      textStyle: const TextStyle(fontSize: 18),
                      minimumSize: const Size.fromHeight(48)
                    ),
                    onPressed: () async {  
                      await context.read<HeroesMergeProvider>().deleteHeroes();
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Data Heroes Successfully Deleted !')
                        )
                      );
                    },
                    child: const Text("Delete Data"),
                  )
              ),
            ),
            Expanded(
              child: ListHeroMain()
            ),
          ]
        )
      ),
    );
  }
}

