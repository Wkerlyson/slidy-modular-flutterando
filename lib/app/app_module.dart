import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_modular_flutterando/app/app_controller.dart';
import 'package:slidy_modular_flutterando/app/app_widget.dart';
import 'package:slidy_modular_flutterando/app/modules/home/home_modular.dart';
import 'package:slidy_modular_flutterando/app/shared/util/constants.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
