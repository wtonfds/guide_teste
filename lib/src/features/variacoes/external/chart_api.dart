import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:guide_ti/src/features/variacoes/data/datasources/chart_datasource.dart';
import 'package:guide_ti/src/features/variacoes/data/models/chart_model.dart';
import 'package:yahoofin/yahoofin.dart';

class ChartApi implements ChartDatasource {
  final Dio dio;

  ChartApi(this.dio);

  @override
  Future<List<ChartModel>> getCharts() async {
    final response = await dio
        .get('https://query2.finance.yahoo.com/v8/finance/chart/PETR4.SA');


    if (response.statusCode == 200) {
      print('passou');
      var json = jsonDecode(response.data);
      final list = (json['chart']['result']['indicators']['quote']
              ['open'] as List)
          .map((e) => ChartModel.fromMap(e))
          .toList();
      print(list);
      return list;
    } else {
      print('error');
      throw Error();
    }
  }

  Future<List<num>>? getChartQuotesOpens() async {
    final yfin = YahooFin();

    StockHistory hist = yfin.initStockHistory(ticker: "GOOG");
    StockChart chart = await yfin.getChartQuotes(
        stockHistory: hist,
        interval: StockInterval.oneDay,
        period: StockRange.fiveYear);

    return chart.chartQuotes!.open!;
  }
}
