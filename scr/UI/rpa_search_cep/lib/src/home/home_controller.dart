import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rpa_search_cep/src/home/models/search_cep_result.dart';
import 'package:rpa_search_cep/src/home/services/search_cep_service.dart';

class HomeController extends GetxController with StateMixin<SearchCepResult> {
  TextEditingController cepController = TextEditingController();

  final SearchCepService searchCepService;

  HomeController(this.searchCepService);

  @override
  void onInit() {
    super.onInit();
    change(SearchCepResult(msg: "No data", isSucess: false),
        status: RxStatus.success());
  }

  //shoul get in API for cep
  Future getAddress() async {
    change(null, status: RxStatus.loading());
    final it = await searchCepService.getAddress(cepController.text);
    change(it, status: RxStatus.success());
  }

  //shoul get in API for cep in cache
  Future getAddressInCacheAPI() async {
    change(null, status: RxStatus.loading());
    final it = await searchCepService.getAddressInCacheAPI(cepController.text);
    change(it, status: RxStatus.success());
  }

  //Should clear text field
  void clearTextField() {
    cepController.clear();
  }
}
