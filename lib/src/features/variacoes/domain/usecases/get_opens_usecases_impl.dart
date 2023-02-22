import 'package:guide_ti/src/features/variacoes/domain/entities/chart_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:guide_ti/src/features/variacoes/domain/repositories/chart_repository.dart';
import 'package:guide_ti/src/features/variacoes/domain/usecases/get_opens_usecases.dart';

class GetOpensUsecasesImpl implements GetOpensUsecases {
  final ChartRepository repository;

  GetOpensUsecasesImpl(this.repository);

  @override
  Future<Either<Error, List<ChartEntity>>> call() {
    return repository.getChats();
  }
  
}