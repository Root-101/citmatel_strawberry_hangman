import 'package:citmatel_strawberry_hangman/src/app/a_module/hangman_core_module.dart';
import 'package:citmatel_strawberry_hangman/src/ui/TestUI.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  HangManCoreModule.init();
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
      initialRoute: TestUI.ROUTE_NAME,
      getPages: [
        GetPage(
          name: TestUI.ROUTE_NAME,
          page: () => TestUI(),
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
