// To parse this JSON data, do
//
//     final searchCepResult = searchCepResultFromJson(jsonString);

import 'dart:convert';

SearchCepResult searchCepResultFromJson(String str) =>
    SearchCepResult.fromJson(json.decode(str));

String searchCepResultToJson(SearchCepResult data) =>
    json.encode(data.toJson());

class SearchCepResult {
  SearchCepResult({
    this.ceps,
    this.msg,
    this.isSucess,
  });

  List<Cep> ceps;
  String msg;
  bool isSucess;

  factory SearchCepResult.fromJson(Map<String, dynamic> json) =>
      SearchCepResult(
        ceps: List<Cep>.from(json["ceps"].map((x) => Cep.fromJson(x))),
        msg: json["msg"],
        isSucess: json["isSucess"],
      );

  Map<String, dynamic> toJson() => {
        "ceps": List<dynamic>.from(ceps.map((x) => x.toJson())),
        "msg": msg,
        "isSucess": isSucess,
      };
}

class Cep {
  Cep({
    this.logradouro,
    this.bairro,
    this.localidade,
    this.cep,
  });

  String logradouro;
  String bairro;
  String localidade;
  String cep;

  factory Cep.fromJson(Map<String, dynamic> json) => Cep(
        logradouro: json["logradouro"],
        bairro: json["bairro"],
        localidade: json["localidade"],
        cep: json["cep"],
      );

  Map<String, dynamic> toJson() => {
        "logradouro": logradouro,
        "bairro": bairro,
        "localidade": localidade,
        "cep": cep,
      };
}
