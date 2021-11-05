import 'package:rpa_search_cep/src/home/models/search_cep_result.dart';
import 'package:rpa_search_cep/src/home/rest/http_client.dart';

class SearcCepAPIRest extends HttpClient {
  Future<SearchCepResult> search(String cepForSearch) async {
    final response = await get(
      'cep/?search=$cepForSearch',
      decoder: (json) {
        if (json is Map) {
          return SearchCepResult.fromJson(json);
        }
        SearchCepResult(
            ceps: [], msg: "Erro ao obter dados da API", isSucess: false);
      },
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return SearchCepResult(
        ceps: [],
        msg: "Falha ao obter dados",
        isSucess: false,
      );
    }
  }

  Future<SearchCepResult> searchCacheAPI(String cepForSearch) async {
    final response = await get(
      'cep/cache?search=$cepForSearch',
      decoder: (json) {
        if (json is Map) {
          return SearchCepResult.fromJson(json);
        }
        SearchCepResult(
            ceps: [], msg: "Erro ao obter dados da API", isSucess: false);
      },
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return SearchCepResult(
        ceps: [],
        msg: "Falha ao obter dados",
        isSucess: false,
      );
    }
  }
}
