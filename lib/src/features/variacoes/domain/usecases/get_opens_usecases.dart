import 'package:dartz/dartz.dart';
import 'package:guide_ti/src/features/variacoes/domain/entities/chart_entity.dart';

abstract class GetOpensUsecases {
  Future<Either<Error, List<ChartEntity>>> call();
}