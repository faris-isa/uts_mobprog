import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_mobprog/data/model/heroes.dart';
import 'package:uts_mobprog/provider/hero_provider.dart';

import '../data/model/heroes_merge.dart';
import 'components/card_hero.dart';

// class OptionModel {
//   final PrimaryAttr value;
//   final String label;

//   OptionModel(this.value, this.label);
// }


class ListHeroScreen extends StatefulWidget {
  ListHeroScreen({Key? key}) : super(key: key);
  
  static const routeName = '/list_hero';

  @override
  _ListHeroScreenState createState() => _ListHeroScreenState();
  
}

class _ListHeroScreenState extends State<ListHeroScreen> {
  bool isLoading = false;

  String name = "";

  String dropdownvalue = 'No Filter';

  List<String> options = [
    'No Filter',
    'ALL',
    'STR',
    'AGI',
    'INT'
  ];

  @override
  Widget build(BuildContext context) {
    List<HeroesMerge> heroesFiltered = 
      Provider.of<HeroesMergeProvider>(
        context,
        listen: false
      ).heroesFiltered;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.8 ,
                  margin: const EdgeInsets.only(left: 16, right: 16, top: 10),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 179, 170, 170),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: Colors.black87),
                      hintText: "Search heroes you're looking for",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 18)
                    ),
                    onChanged: (String value) {
                      setState(() {

                        Provider.of<HeroesMergeProvider>(context, listen: false).filterNameHeroes(value, dropdownvalue);
                      });
                    }
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3.1 ,
                  alignment: AlignmentDirectional.centerStart,
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5, right: 5),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 179, 170, 170),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Center(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        hint: const Text(
                          "No Filter",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),    

                        value: dropdownvalue,
                          
                        // Array list of items
                        items: options.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        // items: options.map<DropdownMenuItem<OptionModel>>((OptionModel option) {
                        //   return DropdownMenuItem<OptionModel>(
                        //     value: option,
                        //     child: Text(option.label),
                        //   );
                        // }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) { 
                          setState(() {
                            dropdownvalue = newValue!;
                            if(newValue == "ALL") {
                              Provider.of<HeroesMergeProvider>(context, listen: false).filteredHeroes(PrimaryAttr.ALL);
                            } else if (newValue == "STR") {
                              Provider.of<HeroesMergeProvider>(context, listen: false).filteredHeroes(PrimaryAttr.STR);
                            } else if (newValue == "AGI") {
                              Provider.of<HeroesMergeProvider>(context, listen: false).filteredHeroes(PrimaryAttr.AGI);
                            } else if (newValue == "INT") {
                              Provider.of<HeroesMergeProvider>(context, listen: false).filteredHeroes(PrimaryAttr.INT);
                            } else {
                              Provider.of<HeroesMergeProvider>(context, listen: false).readHeroes();
                            }
                          });
                        },
                      ),
                    ),
                  )
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 1.32 ,
                child: LayoutBuilder(builder: (context, constraint) {
                  return GridView.builder(
                    itemCount: heroesFiltered.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: constraint.maxWidth > 700 ? 8 : 3,
                      childAspectRatio: 2.6 / 3
                    ),
                    itemBuilder: (context, index) {
                      final hero = heroesFiltered[index];
                      return CardHero(hero: hero);
                    },
                  );
                })
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
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
          ],
        ),
      )
    );
  }
}

