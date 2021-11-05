import 'package:get/get.dart';

class HttpClient extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://localhost:48046/api/';
    // httpClient.errorSafety = false;

    httpClient.maxAuthRetries = 1;
    httpClient.maxRedirects = 1;
  }
}
