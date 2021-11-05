import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rpa_search_cep/src/home/home_bindings.dart';
import 'package:rpa_search_cep/src/home/home_page.dart';

void main() {
  runApp(
    GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Search Cep",
      getPages: [
        GetPage(
          name: "/",
          binding: HomePageBinding(),
          page: () => HomePage(),
        )
      ],
    ),
  );
}
