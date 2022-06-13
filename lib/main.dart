import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
    return GetMaterialApp(
      title: "Rent Assist - Tenant",
      theme: ThemeData(
          primarySwatch: primaryColor,
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
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
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
  }
}
