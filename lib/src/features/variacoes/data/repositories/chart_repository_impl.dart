import 'package:guide_ti/src/features/variacoes/data/datasources/chart_datasource.dart';
import 'package:guide_ti/src/features/variacoes/data/models/chart_model.dart';
import 'package:guide_ti/src/features/variacoes/domain/entities/chart_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:guide_ti/src/features/variacoes/domain/repositories/chart_repository.dart';

class ChartRepositoryImpl implements ChartRepository {
  final ChartDatasource datasource;

  ChartRepositoryImpl(this.datasource);
  @override
  Future<Either<Error, List<ChartEntity>>> getChats() async{
    try {
      List<ChartModel> response = await datasource.getCharts();
      return Right(response);
    } catch (e) {
      return Left(Error());
    }
  }
}