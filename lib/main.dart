import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

import 'app/app_controller.dart';
import 'app/app_repository.dart';
import 'app/routes/app_pages.dart';
import 'app/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  var storage = GetStorage();
  runApp(
    MyApp(storage: storage),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.storage,
  }) : super(key: key);

  final GetStorage storage;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));
    return KhaltiScope(
        publicKey: "test_public_key_26fd9f0c1c634293bbfc7643050b3ddb",
        builder: (context, navigatorKey) {
          return GetMaterialApp(
            navigatorKey: navigatorKey,
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ne', 'NP'),
            ],
            localizationsDelegates: const [
              KhaltiLocalizations.delegate,
            ],
            title: "Rent Assist - Tenant",
            theme: ThemeData(
                primarySwatch: primaryColor,
                scaffoldBackgroundColor: kWhiteColor,
                primaryColor: kPrimaryColor,
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: kPrimaryColor,
                ),
                appBarTheme: AppBarTheme(
                  centerTitle: true,
                  toolbarHeight: 55,
                  shadowColor: kGreyColor.withOpacity(0.2),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  titleTextStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20),
                  elevation: 3,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Theme.of(context).scaffoldBackgroundColor,
                    statusBarIconBrightness: Brightness.dark,
                    statusBarBrightness: Brightness.light,
                  ),
                )),
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            // unknownRoute: GetPage(
            //     name: '/notfound',
            //     page: () => ErrorPage('Page not found.', () {
            //           Get.back();
            //         })),
            initialBinding: BindingsBuilder(() {
              Get.lazyPut(() => AppRepository(Dio(), storage));
              Get.put(AppController(), permanent: true);
            }),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
