import 'package:get/get.dart';
import 'package:rpa_search_cep/src/home/models/search_cep_result.dart';
import 'package:rpa_search_cep/src/home/rest/search_cep_api.dart';

class SearchCepService extends GetxService {
  final SearcCepAPIRest rest;

  SearchCepService(this.rest);

  Future<SearchCepResult> getAddress(String textforsearch) {
    if (textforsearch.trim().isEmpty)
      return Future.value(
        SearchCepResult(
            msg: "Informe o CEP para pesquisa", ceps: [], isSucess: false),
      );
    return rest.search(textforsearch);
  }

  Future<SearchCepResult> getAddressInCacheAPI(String textforsearch) {
    if (textforsearch.trim().isEmpty)
      return Future.value(
        SearchCepResult(
            msg: "Informe o CEP para pesquisa", ceps: [], isSucess: false),
      );
    return rest.searchCacheAPI(textforsearch);
  }
}
