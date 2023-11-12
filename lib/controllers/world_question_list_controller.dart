import 'package:get/get.dart';
import 'package:trivia/pages/WorldItemsPage/WorldQuestionListPage/world_question_list_page.dart';

class WorldQuestionListController extends GetxController {
  RxString currentCategory = ''.obs;
  var backgroundImage = ''.obs;

  void setCurrentCategory(String category) {
    currentCategory.value = category;
    switch (category) {
      case 'Espiritualidad':
        backgroundImage.value = 'assets/images/bg-spirituality.png';
        break;
      case 'Bíblicas':
        backgroundImage.value = 'assets/images/bg-religion.png';
        break;
      case 'Ciencia':
        backgroundImage.value = 'assets/images/bg-science.png';
        break;
      case 'Deportes generales':
        backgroundImage.value = 'assets/images/bg-sports.png';
        break;
      case 'Finanzas e inversiones':
        backgroundImage.value = 'assets/images/bg-finance.png';
        break;
      case 'Historia Oculta':
        backgroundImage.value = 'assets/images/bg-hidden-history.png';
        break;
      case 'Misterios y enigmas':
        backgroundImage.value = 'assets/images/bg-mysteries.png';
        break;
      case 'Astronomía':
        backgroundImage.value = 'assets/images/bg-astronomy.png';
        break;
      case 'Conspiraciones':
        backgroundImage.value = 'assets/images/bg-conspiracies.png';
        break;
      case 'Cultura general':
        backgroundImage.value = 'assets/images/bg-general-culture.png';
        break;
      default:
        backgroundImage.value = "assets/images/background.png";
    }

    Get.to(
      WorldQuestionListPage(),
      duration: const Duration(seconds: 1),
      transition: Transition.circularReveal,
    );
  }
}
