import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SubLevelScreen extends StatefulWidget {
  static const ROUTE_NAME = "/hangman-sublevel-screen";

  SubLevelScreen({Key? key}) : super(key: key);

  @override
  _SubLevelScreenState createState() => _SubLevelScreenState();
}

class _SubLevelScreenState extends State<SubLevelScreen> {
  final int cantOfColumns = 6;

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
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }

  _animatedGridView() {
    return AnimationLimiter(
      child: GridView.count(
        childAspectRatio: 1.0,
        padding: const EdgeInsets.all(8.0),
        crossAxisCount: cantOfColumns,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _animatedGridView(),
      ),
    );
  }
}
