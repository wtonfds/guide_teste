import 'package:guide_ti/src/features/variacoes/data/models/chart_model.dart';

abstract class ChartDatasource {
  Future<List<ChartModel>> getCharts();
}