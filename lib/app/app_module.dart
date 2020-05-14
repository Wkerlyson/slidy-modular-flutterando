import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_modular_flutterando/app/app_controller.dart';
import 'package:slidy_modular_flutterando/app/app_widget.dart';
import 'package:slidy_modular_flutterando/app/pages/home/home_controller.dart';
import 'package:slidy_modular_flutterando/app/pages/home/home_page.dart';
import 'package:slidy_modular_flutterando/app/pages/other/other_apge.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
        Router('/other/:text',
            child: (_, args) => OtherPage(text: args.params['text']))
      ];

  @override
  Widget get bootstrap => AppWidget();
}
