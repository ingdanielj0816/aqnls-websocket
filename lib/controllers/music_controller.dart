
import 'package:get/get.dart';

class MusicController extends GetxController {
  RxBool isPlaying = true.obs;

  void changeIsPlaying() {
    isPlaying(false);
    update();
  }
}