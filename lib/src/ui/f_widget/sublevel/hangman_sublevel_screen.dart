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
                _buildListOfHearts(),
                _buildImageCard(),
                _buildWord(),
                SizedBox(height: 40),
                _buildKeyBoard(),
              ],
            ),
          );
        },
      ),
    );
  }

  _buildKeyBoard() {
    List<String> listOfLetters = controller.answerSpellOut();
    int countOfColumns = listOfLetters.length;
    return _animatedGridView(
      6,
      List.generate(
        countOfColumns,
        (int index) {
          return _buildAnimations(
            index,
            6,
            InkWell(
              child: _emptyCard(listOfLetters[index]),
              onTap: () => controller.isLetterCorrect(listOfLetters[index]),
            ),
          );
        },
      ),
    );
  }

  _buildWord() {
    List<String> listOfLetters = controller.answerToBe;
    int countOfColumns = listOfLetters.length;
    return _animatedGridView(
      countOfColumns,
      List.generate(
        countOfColumns,
        (int index) {
          return _buildAnimations(
            index,
            6,
            _emptyCard(listOfLetters[index]),
          );
        },
      ),
    );
  }

  _buildListOfHearts() {
    int countOfColumns = controller.lives;
    return _animatedGridView(
      countOfColumns,
      List.generate(
        countOfColumns,
        (int index) {
          return _buildAnimations(
            index,
            countOfColumns,
            Icon(
              FontAwesomeIcons.solidHeart,
              color: Colors.red.shade900,
              size: 50,
            ),
          );
        },
      ),
    );
  }

  _buildAnimations(int index, int countOfColumns, Widget widget) {
    return AnimationConfiguration.staggeredGrid(
      columnCount: 6,
      position: index,
      duration: const Duration(milliseconds: 1375),
      child: ScaleAnimation(
        scale: 0.5,
        child: FadeInAnimation(
          child: widget,
        ),
      ),
    );
  }

  _animatedGridView(int cantOfColumns, List<Widget> children) {
    return AnimationLimiter(
      child: GridView.count(
        childAspectRatio: 1.0,
        padding: const EdgeInsets.all(8.0),
        crossAxisCount: cantOfColumns, // Amount of columns in the grid
        shrinkWrap: true, //With this GridView only occupies the space it needs
        physics: NeverScrollableScrollPhysics(), //No scroll needed
        children: children,
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
        child: _fadeImage(controller.imageUrl),
      ),
    );
  }

//Fade the entrnace of the image
  _fadeImage(String imageUrl) {
    return FadeIn(
      child: _animateImage(imageUrl),
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
