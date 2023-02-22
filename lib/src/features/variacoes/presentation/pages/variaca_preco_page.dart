import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:guide_ti/src/features/variacoes/presentation/controlles/variacao_preco_controller.dart';
import 'package:yahoofin/yahoofin.dart';

class VariacaoPrecoPage extends GetView<VariacaoPrecoController> {
  const VariacaoPrecoPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.listTable();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Variação do preço'),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Table(
            border: const TableBorder(
              horizontalInside: BorderSide(
                color: Colors.black,
                style: BorderStyle.solid,
                width: 1.0,
              ),
              verticalInside: BorderSide(
                color: Colors.black,
                style: BorderStyle.solid,
                width: 1.0,
              ),
            ),
            children: controller.chartList,
          ),
        ),
      ),
    );
  }
}
