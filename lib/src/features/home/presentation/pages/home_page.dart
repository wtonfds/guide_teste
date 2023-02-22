// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:guide_ti/src/configs/app_routes.dart';
import 'package:guide_ti/src/features/variacoes/domain/usecases/get_opens_usecases.dart';
import 'package:guide_ti/src/features/variacoes/presentation/controlles/variacao_preco_controller.dart';

class HomePage extends GetView<VariacaoPrecoController> {
  const HomePage({
    Key? key,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    controller.getChartQuotesOpens();
    controller.getChartDatas();
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/guide.png',
          scale: 3.5,
          fit: BoxFit.cover,
        ),
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 100,
      ),
      drawer: Drawer(
        backgroundColor: Colors.cyan.shade900,
        child: Padding(
          padding: const EdgeInsets.only(left: 5, top: 100),
          child: Column(
            children: const [
              Padding(
                padding: EdgeInsets.all(10),
                child: ListTile(
                  leading: Icon(Icons.home, color: Colors.white, size: 26),
                  title: Text(
                    'Home',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: ListTile(
                  leading: Icon(Icons.payment, color: Colors.white, size: 26),
                  title: Text(
                    'Investimentos',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: ListTile(
                  leading:
                      Icon(Icons.exit_to_app, color: Colors.white, size: 26),
                  title: Text(
                    'Sair',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 2, 51, 53),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(40),
              child: Container(
                height: 200,
                //width: 200,
                child: const Text(
                  'Selecione como quer ver a variação dos preços',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (() {
                    Get.toNamed(AppRoutes.variacaoPreco);
                  }),
                  child: Container(
                    width: 150,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.orangeAccent,
                    ),
                    child: const Center(
                      child: Text(
                        'variação do preço',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.variacaoChart),
                  child: Container(
                    width: 150,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 2, 51, 53),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                    child: const Center(
                      child: Text(
                        'gráfico da variação',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
