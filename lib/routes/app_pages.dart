import 'package:get/get.dart';
import 'package:greeve/routes/app_routes.dart';
import 'package:greeve/view/chatbot/screens/chatbot_screen.dart';
import 'package:greeve/view/detail_challenge/screen/detail_challenge_screen.dart';
import 'package:greeve/view/leaderboard/screens/leaderboard_screen.dart';
import 'package:greeve/view/membership/screens/membership_screen.dart';
import 'package:greeve/view/transaction/screens/cart_screen.dart';
import 'package:greeve/view/forgot_password/screens/confirmation_screen.dart';
import 'package:greeve/view/forgot_password/screens/forgot_password_screen.dart';
import 'package:greeve/view/forgot_password/screens/new_pass_screen.dart';
import 'package:greeve/view/forgot_password/screens/otp_screen.dart';
import 'package:greeve/view/list_challenge/list_challenge_wrapper_screen.dart';
import 'package:greeve/view/common/bottom_navigation_screen.dart';
import 'package:greeve/view/greeve_coin/screen/all_voucher_screen.dart';
import 'package:greeve/view/greeve_coin/screen/history_screen.dart';
import 'package:greeve/view/greeve_coin/screen/how_to_get_coin_screen.dart';
import 'package:greeve/view/greeve_coin/screen/greeve_coin_screen.dart';
import 'package:greeve/view/login/screens/loading_screen.dart';
import 'package:greeve/view/login/screens/login_screen.dart';
import 'package:greeve/view/onboarding/screens/on_boarding_screen.dart';
import 'package:greeve/view/product/screens/all_product_screen.dart';
import 'package:greeve/view/product/screens/detail_product_screen.dart';
import 'package:greeve/view/register/register_success_screen.dart';
import 'package:greeve/view/register/screens/register_screen.dart';
import 'package:greeve/view/common/splash_screen.dart';
import 'package:greeve/view/search_product/screen/search_screen.dart';
import 'package:greeve/view/transaction/screens/list_transaction_screen.dart';
import 'package:greeve/view/transaction/screens/transaction_screen.dart';
import 'package:greeve/view/user_profile/screens/edit_profile_screen.dart';
import 'package:greeve/view/user_profile/screens/help_center_screen.dart';
import 'package:greeve/view/user_profile/screens/notification_screen.dart';
import 'package:greeve/view/user_profile/screens/terms_and_condition_screen.dart';
import 'package:greeve/view/user_profile/screens/voucher_screen.dart';

import '../view/environtment_impact/screen/detail_impact_screen.dart';
import '../view/environtment_impact/screen/impact_screen.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.splashApp,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPassScreen(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.otp,
      page: () => const OtpScreen(),
    ),
    GetPage(
      name: AppRoutes.confirmPassword,
      page: () => const ConfirmPassScreen(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterScreen(),
    ),
    GetPage(
      name: AppRoutes.registerSuccess,
      page: () => const RegisterSuccessScreen(),
    ),
    GetPage(
      name: AppRoutes.newPassword,
      page: () => const NewPasswordScreen(),
    ),
    GetPage(
      name: AppRoutes.loading,
      page: () => const LoadingScreen(),
    ),
    GetPage(
      name: AppRoutes.bottomNavigation,
      page: () => const BottomNavScreen(),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnBoardingScreen(),
    ),
    GetPage(
      name: AppRoutes.allProduct,
      page: () => const AllProductScreen(),
    ),
    GetPage(
      name: AppRoutes.detailProduct,
      page: () => const DetailProductScreen(),
    ),
    GetPage(
      name: AppRoutes.cart,
      page: () => const CartScreen(),
    ),
    GetPage(
      name: AppRoutes.searchProduct,
      page: () => const SearchScreen(),
    ),
    GetPage(
      name: AppRoutes.listChallenge,
      page: () => const ListChallengeWrapperScreen(),
    ),
    GetPage(
      name: AppRoutes.detailChallenge,
      page: () => const DetailChallengeScreen(),
    ),
    GetPage(
      name: AppRoutes.editProfile,
      page: () => const EditProfileScreen(),
    ),
    GetPage(
      name: AppRoutes.termsAndConditions,
      page: () => const TermsAndConditionsScreen(),
    ),
    GetPage(
      name: AppRoutes.helpCenter,
      page: () => const HelpCenterScreen(),
    ),
    GetPage(
      name: AppRoutes.notification,
      page: () => const NotificationScreen(),
    ),
    GetPage(
      name: AppRoutes.voucher,
      page: () => const VoucherScreen(),
    ),
    GetPage(
      name: AppRoutes.greeveCoin,
      page: () => const GreeveScreen(),
    ),
    GetPage(
      name: AppRoutes.getCoin,
      page: () => const GetCoinScreen(),
    ),
     GetPage(
      name: AppRoutes.allVoucher,
      page: () => const AllVoucherScreen(),
    ),
    GetPage(
      name: AppRoutes.historyCoin,
      page: () => const HistoryCoinScreen(),
    ),
    GetPage(
      name: AppRoutes.transaction,
      page: () => const TransactionScreen(),
    ),
    GetPage(
      name: AppRoutes.listTransaction,
      page: () => const ListTransactionScreen(),
    ),
    GetPage(
      name: AppRoutes.membership,
      page: () => MembershipScreen(),
    ),
    GetPage(
      name: AppRoutes.membershipSuccess,
      page: () => const MembershiSuccessfullyScreen(),
    ),
    GetPage(
      name: AppRoutes.chatbot,
      page: () => const ChatbotScreen(),
    ),
    GetPage(
      name: AppRoutes.leaderboard,
      page: () => const LeaderboardScreen(),
    ),
    GetPage(
      name: AppRoutes.detailImpact,
      page: () => const DetailImpactScreen(),
    ),
  ];
}
