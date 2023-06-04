import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_mobprog/data/model/heroes_merge.dart';
import 'package:uts_mobprog/provider/pick_provider.dart';
import 'package:uts_mobprog/screens/hero_detail_page.dart';

import 'provider/hero_provider.dart';
import 'screens/list_hero_screen.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HeroesMergeProvider()),
        ChangeNotifierProvider(create: (_) => PickProvider())
      ],
      child: const MainApp()
    )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HeroesMergeProvider>().readHeroes();
    return MaterialApp(
      initialRoute: '/',
      routes: {
        // '/': (context) => MainScreen(),
        '/': (context) => ListHeroScreen(),
        '/hero_detail': (context) => HeroDetailPage(
            ModalRoute.of(context)?.settings.arguments as HeroesMerge),
      },
    );
  }
}
