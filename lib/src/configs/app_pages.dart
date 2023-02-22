import 'package:get/get.dart';
import 'package:guide_ti/src/configs/app_routes.dart';
import 'package:guide_ti/src/features/home/presentation/bindings/home_binding.dart';
import 'package:guide_ti/src/features/home/presentation/pages/home_page.dart';
import 'package:guide_ti/src/features/variacoes/presentation/bindings/variacao_preco_binding.dart';
import 'package:guide_ti/src/features/variacoes/presentation/pages/variaca_preco_page.dart';
import 'package:guide_ti/src/features/variacoes/presentation/pages/variacao_chart.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.variacaoPreco,
      page: () => const VariacaoPrecoPage(),
      binding: VariacaoPrecoBinding(),
    ),
    GetPage(
      name: AppRoutes.variacaoChart,
      page: () => const VariacaoChart(),
      binding: VariacaoPrecoBinding(),
    ),
  ];
}
