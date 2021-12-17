import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

// ignore: must_be_immutable
class HangManSubLevelScreen extends GetView<HangManSubLevelController> {
  static const ROUTE_NAME = "/hangman-sublevel-screen";

  final int cantOfColumns = 6;
  HangManSubLevelScreen({
    required HangManSubLevelDomain subLevelDomain,
  }) : super() {
    Get.put<HangManSubLevelController>(
      HangManSubLevelControllerImpl(
        subLevelDomain: subLevelDomain,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HangManSubLevelController>(
        builder: (_) {
          return SafeArea(
            child: Column(
              children: [
                _animatedGridView(),
              ],
            ),
          );
        },
      ),
    );
  }

  _animatedGridView() {
    return AnimationLimiter(
      child: GridView.count(
        childAspectRatio: 1.0,
        padding: const EdgeInsets.all(8.0),
        crossAxisCount: cantOfColumns, // Amount of columns in the grid
        shrinkWrap: true, //With this GridView only occupies the space it needs
        physics: NeverScrollableScrollPhysics(), //No scroll needed
        children: List.generate(
          12,
          (int index) {
            return AnimationConfiguration.staggeredGrid(
              columnCount: cantOfColumns,
              position: index,
              duration: const Duration(milliseconds: 1375),
              child: ScaleAnimation(
                scale: 0.5,
                child: FadeInAnimation(
                  child: _emptyCard("A"),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _emptyCard(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
            offset: Offset(0.0, 4.0),
          ),
        ],
      ),
      child: Center(
          child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }

}