import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

// ignore: must_be_immutable
class HangManSubLevelScreen extends GetView<HangManSubLevelController> {
  static const ROUTE_NAME = "/hangman-sublevel-screen";

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
                SizedBox(height: 20),
                _buildListOfHearts(5),
                _buildImageCard(),
                _buildWord(5, "_"),
                SizedBox(height: 40),
                _buildKeyBoard(6, 12, "B")
              ],
            ),
          );
        },
      ),
    );
  }

  _buildKeyBoard(int cantOfColumns, int amountOfLetters, String text) {
    return _animatedGridView(
      cantOfColumns,
      amountOfLetters,
      _emptyCard(text),
    );
  }

  _buildWord(int amountOfLetters, String text) {
    return _animatedGridView(
      amountOfLetters,
      amountOfLetters,
      _emptyCard(text),
    );
  }

  _buildListOfHearts(int cantOfHearts) {
    return _animatedGridView(
      cantOfHearts,
      cantOfHearts,
      Icon(
        FontAwesomeIcons.solidHeart,
        color: Colors.red.shade900,
        size: 50,
      ),
    );
  }

  _animatedGridView(int cantOfColumns, int listOfItems, Widget child) {
    return AnimationLimiter(
      child: GridView.count(
        childAspectRatio: 1.0,
        padding: const EdgeInsets.all(8.0),
        crossAxisCount: cantOfColumns, // Amount of columns in the grid
        shrinkWrap: true, //With this GridView only occupies the space it needs
        physics: NeverScrollableScrollPhysics(), //No scroll needed
        children: List.generate(
          listOfItems,
          (int index) {
            return AnimationConfiguration.staggeredGrid(
              columnCount: cantOfColumns,
              position: index,
              duration: const Duration(milliseconds: 1375),
              child: ScaleAnimation(
                scale: 0.5,
                child: FadeInAnimation(
                  child: child,
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

  _buildImageCard() {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 20.0,
      ),
      height: 240.0,
      child: ClipRRect(
        // For the rounded corners
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: _fadeImage(),
      ),
    );
  }

//Fade the entrnace of the image
  _fadeImage() {
    return FadeIn(
      child: _animateImage("assets/icons/brain_in_blue.jpg"),
      duration: Duration(milliseconds: 4000),
      curve: Curves.easeInOutCirc,
    );
  }

  //Addind gestures to the image
  _animateImage(String imageUrl) {
    return PhotoView(
      imageProvider: AssetImage(imageUrl),
      maxScale: PhotoViewComputedScale.covered * 2.0,
      minScale: PhotoViewComputedScale.contained * 0.8,
      initialScale: PhotoViewComputedScale.covered,
      backgroundDecoration: BoxDecoration(color: Colors.transparent),
    );
  }
}
