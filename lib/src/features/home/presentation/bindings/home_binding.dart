import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:guide_ti/src/features/variacoes/data/repositories/chart_repository_impl.dart';
import 'package:guide_ti/src/features/variacoes/external/chart_api.dart';

import '../../../variacoes/domain/usecases/get_opens_usecases.dart';
import '../../../variacoes/domain/usecases/get_opens_usecases_impl.dart';
import '../../../variacoes/presentation/controlles/variacao_preco_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {

    final Dio dio = Dio();

    final ChartApi chartApi = ChartApi(dio);

    final ChartApi datasource = ChartApi(dio);
    final ChartRepositoryImpl chartRepositoryImpl= ChartRepositoryImpl(datasource);
    final GetOpensUsecasesImpl getOpensUsecasesImpl = GetOpensUsecasesImpl(chartRepositoryImpl);

    Get.lazyPut<VariacaoPrecoController>(() => VariacaoPrecoController());

    Get.lazyPut(()=>Dio());
    Get.lazyPut<ChartRepositoryImpl>(() => ChartRepositoryImpl(chartApi));

  }
  
}