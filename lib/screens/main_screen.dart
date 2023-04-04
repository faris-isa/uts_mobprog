import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_mobprog/provider/hero_provider.dart';
import 'package:uts_mobprog/widget/list_hero_main.dart';

import '../data/model/heroes.dart';
import 'hero_detail_page.dart';


class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
  
}

class _MainScreenState extends State<MainScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dota 2 Heroes'),
        backgroundColor: Colors.red[200],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
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

