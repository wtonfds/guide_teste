import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:guide_ti/src/features/variacoes/presentation/controlles/variacao_preco_controller.dart';

class VariacaoChart extends GetView<VariacaoPrecoController> {
  const VariacaoChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gráfico da variação'),
        centerTitle: true,
      ),
      body: Container(
        child: LineChart(
          LineChartData(
            lineBarsData: [
              LineChartBarData(
                spots: controller.charts.map((e) => FlSpot(e, e)).toList(),
              )
            ],
          ),
          swapAnimationDuration: const Duration(milliseconds: 150),
          swapAnimationCurve: Curves.linear,
        ),
      ),
    );
  }
}