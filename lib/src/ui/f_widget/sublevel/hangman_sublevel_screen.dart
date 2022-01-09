import 'package:animations/animations.dart';
import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart'
    hide FadeInAnimation, FadeIn;
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

// ignore: must_be_immutable
class HangManSubLevelScreen extends StatefulWidget {
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
  State<HangManSubLevelScreen> createState() => _HangManSubLevelScreenState();
}

class _HangManSubLevelScreenState extends State<HangManSubLevelScreen> {
  late final HangManSubLevelController _controller;

  @override
  void initState() {
    _controller = Get.find();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    Get.delete<HangManSubLevelController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GetBuilder<HangManSubLevelController>(
            builder: (_) {
              return _buildListOfHearts();
            },
          ),
          // This one haven't the GetBuilder<HangManSubLevelController>
          // because is no need to rebuild the image ever.
          _buildImageCard(),
          GetBuilder<HangManSubLevelController>(
            builder: (_) {
              return _buildWord();
            },
          ),
          GetBuilder<HangManSubLevelController>(
            builder: (_) {
              return _buildKeyBoard();
            },
          ),
        ],
      ),
    );
  }

  // Build the keyBoard Widget and all of its animations.
  _buildKeyBoard() {
    List<String> listOfLetters = _controller.keyboard;
    return _animatedGridView(
      // GridView amount of columns = ListLetter/6.
      _controller.keyboardColumns,
      List.generate(
        // List amount of items = ListLetters.
        listOfLetters.length,
        // Current item.
        (int index) {
          // If the letter is already used ...
          return _controller.isUsed(listOfLetters[index])
              // If the letter is correct, it belongs to the answer ...
              ? _controller.answerContainLetter(listOfLetters[index])
                  // Make the Bounce effect when is true and paint the letter green.
                  ? Bounce(
                      child: _emptyCard(
                        listOfLetters[index],
                        Colors.lightGreen.shade300,
                        Colors.transparent,
                      ),
                    )
                  // Make the Shake effect when is false and paint the letter red.
                  : Shake(
                      child: _emptyCard(
                        listOfLetters[index],
                        Colors.redAccent.shade100,
                        Colors.transparent,
                      ),
                    )
              // If the letter hasn't been used, paint it gray and call the method checkLetter() when is touched.
              : _buildAnimations(
                  index,
                  _controller.keyboardColumns,
                  InkWell(
                    child: _emptyCard(
                      listOfLetters[index],
                      Colors.white,
                      Colors.grey.shade700,
                    ),
                    onTap: () => _controller.checkLetter(listOfLetters[index]),
                  ),
                );
        },
      ),
    );
  }

  // Build the word Answer Widget and all of its animations.
  _buildWord() {
    List<String> listOfLetters = _controller.answerToBe;
    int countOfColumns = listOfLetters.length;
    return _animatedGridView(
      // Amount of Columns = Letters.
      countOfColumns,
      List.generate(
        // Amount of Items = Letters.
        countOfColumns,
        (int index) {
          // If the current item of the list of letters is blank...
          return listOfLetters[index].contains("_")
              // Make an empty letter card.
              ? _buildAnimations(
                  index,
                  6,
                  _emptyCard(
                    listOfLetters[index],
                    Colors.white,
                    Colors.grey,
                  ))
              //If it's fill show the RubberBand effect and put the correct letter.
              : RubberBand(
                  child: _emptyCard(
                  listOfLetters[index],
                  Colors.white,
                  Colors.grey,
                ));
        },
      ),
    );
  }

  // Build the List of Hearts Widget and all of its animations.
  _buildListOfHearts() {
    int countOfColumns = _controller.lives;
    return _animatedGridView(
        // Amount of Columns = Hearts.
        countOfColumns,
        List.generate(
          // Amount of Items = Hearts.
          countOfColumns,
          // Current item.
          (int index) {
            // If the current item/heart is less that the losed lives ...
            return index < _controller.lives - _controller.remainingLives
                // Broke a heart and make the Swing animation.
                ? Swing(
                    child: Icon(
                      FontAwesomeIcons.heartBroken,
                      color: Colors.red.shade900,
                      size: 50,
                    ),
                  )
                // If it's a remaining live make a pumping heart.
                : _buildAnimations(
                    index,
                    countOfColumns,
                    SpinKitPumpingHeart(
                      color: Colors.red.shade900,
                      size: 55,
                    ),
                  );
          },
        ));
  }

  // This method makes that the widget child enters to the screen with a Scale and Fade Animation.
  _buildAnimations(int index, int countOfColumns, Widget widget) {
    return AnimationConfiguration.staggeredGrid(
      columnCount: countOfColumns,
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

// This method animates the GridView so the items simulate to be entering to the screen one by one.
  _animatedGridView(int cantOfColumns, List<Widget> children) {
    return AnimationLimiter(
      child: GridView.count(
        childAspectRatio: 1.0,
        padding: const EdgeInsets.all(8.0),
        // Amount of columns in the grid
        crossAxisCount: cantOfColumns,
        //With this GridView only occupies the space it needs
        shrinkWrap: true,
        //No scroll needed
        physics: NeverScrollableScrollPhysics(),
        children: children,
      ),
    );
  }

  // This method creates a decorated empty card, that is going to have a letter in the middle.
  _emptyCard(String text, Color decorationColor, Color shadowColor) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: decorationColor,
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: shadowColor,
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

  //This method is used to build the image widget.
  _buildImageCard() {
    return OpenContainer(
      // The transition to display when you move from the closed widget to the open one.
      transitionType: ContainerTransitionType.fade,
      transitionDuration: Duration(seconds: 1),
      openColor: Colors.transparent,
      // The content that will be displayed when the widget opens.
      openBuilder: (context, _) => _buildBigImage(),
      closedElevation: 20,
      closedColor: Colors.transparent,
      // The content that will be displayed when the widget is closed.
      closedBuilder: (context, _) => _buildSmallImage(),
    );
  }

  //This method builds the image when is small.
  _buildSmallImage() {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 20.0,
      ),
      height: 240.0,
      child: ClipRRect(
        // For the rounded corners
        borderRadius: BorderRadius.all(Radius.circular(15)),
        // Call the _fadeImage method for the fade effect.
        child: _fadeImage(_controller.imageUrl),
      ),
    );
  }

  //This method builds the image when it fills the entire screen.
  _buildBigImage() {
    return Container(
      width: double.infinity,
      height: double.maxFinite,
      alignment: Alignment.center,
      // Call the _animateImage so the image can use diferents tipes of gestures.
      child: _animateImage(_controller.imageUrl),
    );
  }

  //Fade the entrance of the image.
  _fadeImage(String imageUrl) {
    return FadeIn(
      child: _animateImage(imageUrl),
      duration: Duration(milliseconds: 4000),
      curve: Curves.easeInOutCirc,
    );
  }

  //Addind gestures to the image.
  _animateImage(String imageUrl) {
    return PhotoView(
      imageProvider: AssetImage(imageUrl),
      //So the image only can be increased to a fit size.
      maxScale: PhotoViewComputedScale.covered * 2.0,
      // So the image only can be reduced to a fit size.
      minScale: PhotoViewComputedScale.covered,
      // The initial scale takes all the available space.
      initialScale: PhotoViewComputedScale.covered,
      // Color of the background space when the image is reduce
      backgroundDecoration: BoxDecoration(color: Colors.transparent),
    );
  }
}
