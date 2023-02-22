import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:guide_ti/src/features/variacoes/data/models/chart_model.dart';
import 'package:guide_ti/src/features/variacoes/domain/entities/chart_entity.dart';
import 'package:guide_ti/src/features/variacoes/domain/usecases/get_opens_usecases.dart';
import 'package:yahoofin/yahoofin.dart';

class VariacaoPrecoController extends GetxController {

  final _charts = <dynamic>[].obs;
  List<dynamic> get charts => _charts;
  set charts(List<dynamic> value) => _charts.value = value;

  final _dates = <dynamic>[].obs;
  List<dynamic> get dates => _dates;
  set dates(List<dynamic> value) => _dates.value = value;

  final _chartList = <TableRow>[].obs;
  List<TableRow> get chartList => _chartList;
  set chartList(List<TableRow> value) => _chartList.value = value;

  Future<dynamic> getChartQuotesOpens() async {
    final yfin = YahooFin();
    StockHistory hist = yfin.initStockHistory(ticker: "PETR4.SA");
    StockChart chart = await yfin.getChartQuotes(
      stockHistory: hist,
      interval: StockInterval.oneDay,
      period: StockRange.fiveYear,
    );

    for (var c in chart.chartQuotes!.open!) {
      var count = 0;
      print('value: ${charts.length}');
      if(charts.length < 30){
        charts.add(c);
      }
    }
  }

  Future<void> getChartDatas() async {
    final yfin = YahooFin();
    StockHistory hist = yfin.initStockHistory(ticker: "PETR4.SA");
    StockChart chart = await yfin.getChartQuotes(
      stockHistory: hist,
      interval: StockInterval.oneDay,
      period: StockRange.fiveYear,
    );
    for (var d in chart.chartQuotes!.timestamp!) {
      dates.add(d);
    }

  }

    _criarLinhaTable(String listaNomes) {
      return TableRow(
        children: listaNomes.split(',').map((name) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: const TextStyle(fontSize: 12),
            ),
          );
        }).toList(),
      );
    }

    listTable(){
      chartList.add(_criarLinhaTable('Dia, Data, Valor, Variação em relação a D-1, Variação em relação a primeiro dia'));
      for (var i = 0; i < 30; i++) {
        print(dates[i]);
        var date = DateTime.fromMicrosecondsSinceEpoch(1521032400);
        var formatDate = '${date.day + i}/${date.month}/${date.year}';
        var valor = charts[i];
        var variacaoD1 = i == 0 ? 0.0 : (charts[i] / charts[(i-1)]) * 100;
        var variacaoPrimeiraData = (charts[i] / charts[0] -1) * 100;

        chartList.add(_criarLinhaTable('${i+1}, $formatDate, $valor, $variacaoD1 %, $variacaoPrimeiraData %'));
  
      }
      return chartList;
    }
}
