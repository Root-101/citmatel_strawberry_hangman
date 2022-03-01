import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(SplashScreen());
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
              /*DnDSubLevelScreen(
                  subLevelDomain: DnDLevel1.level1.sublevel[0]),*/
              //entrada a el grid de seleccion de niveles
              HangManLevelsScreen(mute: false),
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

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return MyApp();
        }
      },
    );
  }
}

class Init {
  Init._();

  static final instance = Init._();

  Future initialize() async {
    await HangManUIModule.init();
  }
}
