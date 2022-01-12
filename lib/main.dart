import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  HangManUIModule.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'HanMan Tutorial',
      //--------------------- <THEAMING> -----------------------------------
      darkTheme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.deepOrange,
      ),
      //--------------------- </THEAMING> -----------------------------------
      //--------------------- <PAGINATION> -----------------------------------
      initialRoute: HangManLevelsScreen.ROUTE_NAME,
      getPages: [
        GetPage(
          name: HangManLevelsScreen.ROUTE_NAME,
          page: () =>
              //entrada directo al nivel 1
              /*HangManSubLevelScreen(
                  subLevelDomain: HangManLevel1.level1.sublevel[0]),*/
              //entrada a el grid de seleccion de niveles
              HangManLevelsScreen(),
          transition: Transition.rightToLeft,
        ),
      ],
      /*unknownRoute: GetPage(
          name: UnknownRouteScreen.ROUTE_NAME,
          page: () => UnknownRouteScreen()),*/
      //--------------------- </PAGINATION> -----------------------------------
    );
  }
}
