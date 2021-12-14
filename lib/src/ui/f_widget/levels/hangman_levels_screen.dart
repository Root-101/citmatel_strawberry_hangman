import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_view_indicators/page_view_indicators.dart';

class HangManLevelsScreen extends GetView<LevelController> {//TODO: valorar ese nombre que no me convence
  static const ROUTE_NAME = "/hangman-levels-screen";

  HangManLevelsScreen({Key? key}) : super(key: key);

  //for page view and indicators
  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Colors
            .white, //default color, sobre este se pone la imagen correspondiente a cada nivel
      ),
      child: ArrowPageIndicator(
        iconSize: 25,
        isInside: true,
        pageController: _pageController,
        currentPageNotifier: _currentPageNotifier,
        itemCount: controller.count(),
        child: Stack(
          children: <Widget>[
            _buildPageView(),
            _buildCircleIndicator(),
          ],
        ),
      ),
    );
  }

  _buildPageView() {
    return Container(
      child: PageView.builder(
        itemCount: controller.count(),
        controller: _pageController,
        itemBuilder: (BuildContext context, int index) {
          return _buildLevelGridView(controller.findAll()[index]);
        },
        onPageChanged: (int index) {
          _currentPageNotifier.value = index;
        },
      ),
    );
  }

  _buildCircleIndicator() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CirclePageIndicator(
          size: 10,
          selectedSize: 12,
          itemCount: controller.count(),
          currentPageNotifier: _currentPageNotifier,
        ),
      ),
    );
  }

  _buildLevelGridView(LevelDomain level) {
    return GridView(
      physics: BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      children: level.sublevel
          .map(
            (subLevel) => SingleLevelTile(subLevelDomain: subLevel),
          )
          .toList(),
    );
  }
}
