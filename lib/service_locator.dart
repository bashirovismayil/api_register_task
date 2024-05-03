import 'package:api_login/auth.dart';
import 'package:api_login/auth_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final locator = GetIt.instance;

void setupLocator() {
  Dio dio = Dio();

  String baseUrl = 'https://rmusayevr.pythonanywhere.com';

  locator.registerSingleton<AuthContract>(
    AuthRepository(dio: dio, baseUrl: baseUrl),
  );
}
