import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_modular_flutterando/app/app_controller.dart';
import 'package:slidy_modular_flutterando/app/app_widget.dart';
import 'package:slidy_modular_flutterando/app/pages/home/home_controller.dart';
import 'package:slidy_modular_flutterando/app/pages/home/home_page.dart';
import 'package:slidy_modular_flutterando/app/pages/other/other_apge.dart';
import 'package:slidy_modular_flutterando/app/shared/repositories/poke_repository.dart';
import 'package:slidy_modular_flutterando/app/shared/util/constants.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => HomeController(i.get<PokeRepository>())),
        Bind((i) => PokeRepository(i.get<Dio>())),
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
        Router('/other', child: (_, args) => OtherPage())
      ];

  @override
  Widget get bootstrap => AppWidget();
}
