import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'baselib/app_services.dart';
import 'baselib/localization_service.dart';
import 'baselib/service_locator.dart';
import 'pages/main/main_widget.dart';
import 'services/quran_provider.dart';

var sl = ServiceLocator();

void registerInjector() {
  sl.registerLazySingleton<ILocalizationService>(() {
    return LocalizationService();
  });
  sl.registerLazySingleton<AppServices>(() {
    return AppServicesImplementation();
  });
  sl.registerBuilder<AssetBundle>(() {
    return PlatformAssetBundle();
  });
  sl.registerLazySingleton<QuranProvider>(() {
    return JsonQuranProvider();
  });
}

void main() {
  registerInjector();

  runApp(
    MaterialApp(
      theme: ThemeData(),
      builder: (context, child) {
        return MainWidget();
      },
    ),
  );
}
