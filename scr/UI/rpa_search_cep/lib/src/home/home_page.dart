import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rpa_search_cep/src/home/models/search_cep_result.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Busca CEP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.cepController,
              decoration: InputDecoration(
                labelText: 'CEP',
                suffix: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      controller.clearTextField();
                    },
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      controller.getAddress();
                    },
                    child: Text('Search'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      controller.getAddressInCacheAPI();
                    },
                    child: Text('Search in api cache'),
                  ),
                ),
              ],
            ),
            controller.obx(
              (state) {
                if (state.isSucess && state.ceps.length > 0) {
                  return _buildList(state.ceps);
                }

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(state.msg),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

//shoul return a List with cep and address
  Widget _buildList(List<Cep> ceps) {
    return Expanded(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    Text(ceps[index].cep, style: TextStyle(fontSize: 20)),
                    Divider(),
                    ListTile(
                      title: Text(ceps[index].logradouro),
                      subtitle: Text(
                          "${ceps[index].bairro} - ${ceps[index].localidade}"),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (ctx, index) {
              return Divider();
            },
            itemCount: ceps.length));
  }
}
