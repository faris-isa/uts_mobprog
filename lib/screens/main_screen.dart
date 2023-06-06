import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_mobprog/provider/hero_provider.dart';
import 'package:uts_mobprog/provider/pick_provider.dart';

import '../data/model/heroes_merge.dart';


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
      body: Center(
        child: Container(
          color: Colors.black87,
          alignment: Alignment.bottomCenter,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset("assets/images/baby_roshan.png", 
                height: 720, 
                fit: BoxFit.cover
              ),
              Positioned(
                bottom: 200.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(280.0, 60.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),
                  onPressed:() {
                    Navigator.pushNamed(context, '/list_hero');
                  },
                  child: const Text('All Heroes', style: TextStyle(fontSize: 24.0, fontFamily: 'PlusJakartaSans'),),
                ),
              ),
              Positioned(
                bottom: 120,
                child: context.select(
                  (PickProvider data) => data.direTeamPick.isEmpty && data.radiantTeamPick.isEmpty 
                  ? ElevatedButton(
                      onPressed:() {
                        
                      },
                      style: ElevatedButton.styleFrom(
                        // padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(horizontal: 120.0))
                        minimumSize: const Size(280.0, 60.0),
                        backgroundColor: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        )
                      ),
                      child: const Text('Picked Heroes', style: TextStyle(fontSize: 24.0, fontFamily: 'PlusJakartaSans', color: Colors.black),),
                    )
                  : ElevatedButton(
                      onPressed:() {
                        Navigator.pushNamed(context, '/pick_hero');
                      },
                      style: ElevatedButton.styleFrom(
                        // padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(horizontal: 120.0))
                        minimumSize: const Size(280.0, 60.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        )
                      ),
                      child: const Text('Picked Heroes', style: TextStyle(fontSize: 24.0, fontFamily: 'PlusJakartaSans'),),
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}

