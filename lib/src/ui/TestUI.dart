import 'package:citmatel_strawberry_hangman/src/app/hangman_app_exporter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestUI extends StatelessWidget {
  static const ROUTE_NAME = "/hangman-levels-screen";

  const TestUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "${Get.find<LevelUseCase>().findAll()}",
      ),
    );
  }
}
