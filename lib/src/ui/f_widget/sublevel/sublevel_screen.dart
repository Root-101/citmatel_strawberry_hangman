import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SubLevelScreen extends GetView<SubLevelController> {
  static const ROUTE_NAME = "/hangman-sublevel-screen";

  SubLevelScreen({
    required SubLevelDomain subLevelDomain,
  }) : super() {
    Get.put<SubLevelController>(
      SubLevelControllerImpl(
        subLevelDomain: subLevelDomain,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubLevelController>(
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Subnivel de HangMan"),
            ],
          ),
        );
      },
    );
  }
}
