import 'package:riverine/config/application.dart';
import 'package:riverine/langs/langs.dart';
import 'package:riverine/res/export.dart';
import 'package:riverine/store/initial_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import 'util/theme_util.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  InitialBinding().dependencies();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(750, 1334),
      builder: (context, child) => GetMaterialApp(
        title: 'Riverine'.tr,
        localizationsDelegates: const [
          FormBuilderLocalizations.delegate,
        ],
        translations: Messages(),
        locale: LocaleUtil.getDefault(),
        fallbackLocale: Locale('en', 'US'),
        initialRoute: GetStorage().hasData(Constant.keyToken) ? RouteConfig.main : RouteConfig.login,
        getPages: RouteConfig.getPages,
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(
          builder: (context, child) {
            if (Device.isAndroid) {
              ThemeUtil.setSystemNavigationBar();
            }
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!,
            );
          },
        ),
        theme: ThemeUtil.getTheme(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Application.getInstance().init();
  }
}