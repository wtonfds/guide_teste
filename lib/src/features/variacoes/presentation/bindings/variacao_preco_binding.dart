import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:guide_ti/src/core/utils/custom_dio.dart';
import 'package:guide_ti/src/features/variacoes/data/datasources/chart_datasource.dart';
import 'package:guide_ti/src/features/variacoes/data/repositories/chart_repository_impl.dart';
import 'package:guide_ti/src/features/variacoes/domain/repositories/chart_repository.dart';
import 'package:guide_ti/src/features/variacoes/domain/usecases/get_opens_usecases.dart';
import 'package:guide_ti/src/features/variacoes/domain/usecases/get_opens_usecases_impl.dart';
import 'package:guide_ti/src/features/variacoes/external/chart_api.dart';
import 'package:guide_ti/src/features/variacoes/presentation/controlles/variacao_preco_controller.dart';

class VariacaoPrecoBinding implements Bindings {
  @override
  void dependencies() {
    final Dio dio = Dio();
    final ChartApi datasource = ChartApi(dio);
    final ChartRepositoryImpl chartRepositoryImpl= ChartRepositoryImpl(datasource);
    final GetOpensUsecasesImpl getOpensUsecasesImpl = GetOpensUsecasesImpl(chartRepositoryImpl);

    Get.lazyPut<VariacaoPrecoController>(() => VariacaoPrecoController());
  } 
}