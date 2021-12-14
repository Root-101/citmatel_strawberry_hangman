import 'package:citmatel_strawberry_hangman/src/app/hangman_app_exporter.dart';
import 'package:get/get.dart';

abstract class SubLevelController extends GetxController {
  static const String TAG = "sub-level-controller";

  SubLevelDomain get subLevelDomain;
}
