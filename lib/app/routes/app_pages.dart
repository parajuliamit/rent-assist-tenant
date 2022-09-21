import 'package:get/get.dart';

import '../modules/account/change_password/bindings/change_password_binding.dart';
import '../modules/account/change_password/views/change_password_view.dart';
import '../modules/account/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/account/edit_profile/views/edit_profile_view.dart';
import '../modules/account/saved_payment/bindings/saved_payment_binding.dart';
import '../modules/account/saved_payment/views/saved_payment_view.dart';
import '../modules/authentication/login/bindings/login_binding.dart';
import '../modules/authentication/login/views/login_view.dart';
import '../modules/authentication/register/bindings/register_binding.dart';
import '../modules/authentication/register/views/register_view.dart';
import '../modules/complaint/add_complaint/bindings/add_complaint_binding.dart';
import '../modules/complaint/add_complaint/views/add_complaint_view.dart';
import '../modules/complaint/bindings/complaint_binding.dart';
import '../modules/complaint/views/complaint_view.dart';
import '../modules/complaint_detail/bindings/complaint_detail_binding.dart';
import '../modules/complaint_detail/views/complaint_detail_view.dart';
import '../modules/navigation/bindings/navigation_binding.dart';
import '../modules/navigation/views/navigation_view.dart';
import '../modules/qr_response/bindings/qr_response_binding.dart';
import '../modules/qr_response/views/qr_response_view.dart';
import '../modules/scan_owner/bindings/scan_owner_binding.dart';
import '../modules/scan_owner/views/scan_owner_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => NavigationView(),
      binding: NavigationBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
      children: [
        GetPage(
          name: _Paths.SPLASH_SCREEN,
          page: () => SplashScreenView(),
          binding: SplashScreenBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.NAVIGATION,
      page: () => NavigationView(),
      binding: NavigationBinding(),
    ),
    GetPage(
      name: _Paths.COMPLAINT,
      page: () => ComplaintView(),
      binding: ComplaintBinding(),
    ),
    GetPage(
      name: _Paths.ADD_COMPLAINT,
      page: () => AddComplaintView(),
      binding: AddComplaintBinding(),
    ),
    GetPage(
      name: _Paths.SAVED_PAYMENT,
      page: () => SavedPaymentView(),
      binding: SavedPaymentBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.SCAN_OWNER,
      page: () => ScanOwnerView(),
      binding: ScanOwnerBinding(),
    ),
    GetPage(
      name: _Paths.COMPLAINT_DETAIL,
      page: () => ComplaintDetailView(),
      binding: ComplaintDetailBinding(),
    ),
    GetPage(
      name: _Paths.QR_RESPONSE,
      page: () => QrResponseView(),
      binding: QrResponseBinding(),
    ),
  ];
}
