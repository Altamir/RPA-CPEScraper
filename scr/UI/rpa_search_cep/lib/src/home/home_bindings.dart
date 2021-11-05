import 'package:get/get.dart';
import 'package:rpa_search_cep/src/home/rest/search_cep_api.dart';
import 'package:rpa_search_cep/src/home/services/search_cep_service.dart';

import 'home_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearcCepAPIRest>(
      () => SearcCepAPIRest(),
    );
    Get.lazyPut(() => SearchCepService(Get.find<SearcCepAPIRest>()));
    Get.lazyPut<HomeController>(
      () => HomeController(Get.find<SearchCepService>()),
    );
  }
}
