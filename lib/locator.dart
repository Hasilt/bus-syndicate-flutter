import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hackstudio_flutter/stores/home_store.dart';
import 'package:location/location.dart';

import 'shared/providers/home_provider.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => HomeStore());
  locator.registerLazySingleton(() => Location());
  locator.registerLazySingleton(() => Dio());
  locator.registerLazySingleton(() => HomeProvider());
}
