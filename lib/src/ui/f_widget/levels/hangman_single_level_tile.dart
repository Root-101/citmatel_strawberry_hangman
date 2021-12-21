import 'package:animations/animations.dart';
import 'package:citmatel_strawberry_hangman/hangman_exporter.dart';
import 'package:flutter/material.dart';

class HangManSingleLevelTile extends StatelessWidget {
  final HangManSubLevelDomain subLevelDomain;

  const HangManSingleLevelTile({required this.subLevelDomain, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OpenContainer(
        transitionDuration: Duration(milliseconds: 500),
        transitionType: ContainerTransitionType.fadeThrough,
        closedBuilder: (context, action) => _buildClosed(),
        openBuilder: (context, action) => _buildOpen(),
      ),
    );
  }

  //Tile chiquito que se muestra en la lista con todos los subniveles
  _buildClosed() {
    return Container(
      child: Center(
        child: Text('level ${subLevelDomain.id}'),
      ),
    );
  }

  //Screen grande para cuando se entra al subnivel, pantalla de cargando para el sub nivel
  _buildOpen() {
    return HangManSubLevelBackground(subLevelDomain: subLevelDomain);
  }
}
