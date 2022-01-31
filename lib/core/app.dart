import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qeapp_trip/core/components/qrcodescanner/pages/result_search_qrcode_scanner_component_page.dart';
import 'package:qeapp_trip/data/repositories/search/search_repository.dart';
import 'package:qeapp_trip/features/settings_qrcode_scanner/controllers/settings_qrcode_scanner_controller.dart';
import 'package:qeapp_trip/features/settings_qrcode_scanner/pages/settings_qrcode_scanner_page.dart';
import 'package:qeapp_trip/infra/http/http_imp.dart';

import '/core/theme/app_theme.dart';

import '/features/details/controller/details_controller.dart';
import '/features/details/pages/details_page.dart';
import '/features/login/pages/login_page.dart';
import '/features/splash/page/splash_page.dart';

import 'components/qrcodescanner/controllers/qrcode_scanner_component_controller.dart';
import 'components/qrcodescanner/pages/qrcode_scanner_component_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DetailsController>(
          create: (_) => DetailsController(),
        ),
        Provider<SettingsQrCodeScannerController>(
          create: (_) => SettingsQrCodeScannerController(),
        ),
        Provider<QrCodeScannerComponentController>(
          create: (_) => QrCodeScannerComponentController(SearchRepositoryImp(httpClient: HttpClientImp())),
        )
      ],
      child: ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: () => MaterialApp(
          title: "App Viagem",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            scaffoldBackgroundColor: AppTheme.colors.background,
            appBarTheme: AppBarTheme(
              backgroundColor: AppTheme.colors.background,
              elevation: 0,
            ),
          ),
          initialRoute: '/splash',
          routes: {
            '/splash': (context) => const SplashScreen(),
            '/login': (context) => const LoginAuthenticationPage(),
            '/details': (context) => DetailsPage(),
            '/qrcodescanner': (context) => const QrCodeScannerComponentPage(),
            '/settingsqrcodescanner': (context) => const SettingsQrCodeScannerPage(),
            '/result_search_qrcode_scanner': (context) => const ResultSearchQrCodeScannerComponentPage(),
          },
        ),
      ),
    );
  }
}