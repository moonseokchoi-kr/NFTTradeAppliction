import 'package:application/screens/Selling/selling_screen.dart';
import 'package:application/init/init.dart';
import 'package:application/screens/process/item_process.dart';
import 'package:application/screens/process/sign_in_process.dart';
import 'package:application/screens/process/sign_up_process.dart';
import 'package:application/screens/process/transfer_process.dart';
import 'package:application/screens/purchasePage/purchase.dart';
import 'package:application/screens/cart/cart_screen.dart';
import 'package:application/screens/complete_profile/complete_profile_screen.dart';
import 'package:application/screens/details/details_screen.dart';
import 'package:application/screens/forgot_password/forgot_password_screen.dart';
import 'package:application/screens/home/home_screen.dart';
import 'package:application/screens/login_success/signup_success_screen.dart';
import 'package:application/screens/otp/otp_screen.dart';
import 'package:application/screens/setting/setting_screen.dart';
import 'package:application/screens/wallet/components/nft_detail_screen.dart';
import 'package:application/screens/wallet/components/token_detail.dart';
import 'package:application/screens/wallet/components/token_trasfer.dart';
import 'package:application/screens/wallet/wallet_screen.dart';
import 'package:application/screens/sign_in/account_screen.dart';
import 'package:application/screens/sign_up/password_screen.dart';
import 'package:application/screens/sign_up/sign_up_screen.dart';
import 'package:application/screens/splash/splash_screen.dart';

import 'package:get/get.dart';

final routes = [
  GetPage(
    name: SplashScreen.routeName,
    page: () => SplashScreen(),
  ),
  GetPage(
    name: SignInScreen.routeName,
    page: () => SignInScreen(),
  ),
  GetPage(
    name: ForgotPasswordScreen.routeName,
    page: () => ForgotPasswordScreen(),
  ),
  GetPage(
    name: SignUpSuccessScreen.routeName,
    page: () => SignUpSuccessScreen(),
  ),
  GetPage(
    name: AccountScreen.routeName,
    page: () => AccountScreen(),
  ),
  GetPage(
    name: PasswordScreen.routeName,
    page: () => PasswordScreen(),
  ),
  GetPage(
      name: CompleteProfileScreen.routeName,
      page: () => CompleteProfileScreen()),
  GetPage(
    name: OtpScreen.routeName,
    page: () => OtpScreen(),
  ),
  GetPage(
    name: HomeScreen.routeName,
    page: () => HomeScreen(),
  ),
  GetPage(
    name: DetailsScreen.routeName,
    page: () => DetailsScreen(),
  ),
  GetPage(
    name: CartScreen.routeName,
    page: () => CartScreen(),
  ),
  GetPage(
    name: WalletScreen.routeName,
    page: () => WalletScreen(),
  ),
  GetPage(
    name: TokenDetailScreen.routeName,
    page: () => TokenDetailScreen(),
  ),
  GetPage(
    name: TokenTransferScreen.routeName,
    page: () => TokenTransferScreen(),
  ),
  GetPage(
    name: NFTDetailScreen.routeName,
    page: () => NFTDetailScreen(),
  ),
  GetPage(
    name: PurchaseScreen.routeName,
    page: () => PurchaseScreen(),
  ),
  GetPage(
    name: InitScreen.routeName,
    page: () => InitScreen(),
  ),
  GetPage(
    name: SellingScreen.routeName,
    page: () => SellingScreen(),
  ),
  GetPage(
    name: SettingScreen.routeName,
    page: () => SettingScreen(),
  ),
  GetPage(
    name: SignInProcessScreen.routeName,
    page: () => SignInProcessScreen(),
  ),
  GetPage(
    name: TransferProcessScreen.routeName,
    page: () => TransferProcessScreen(),
  ),
  GetPage(
    name: SignUpProcessScreen.routeName,
    page: () => SignUpProcessScreen(),
  ),
  GetPage(
    name: ItemProcessScreen.routeName,
    page: () => ItemProcessScreen(),
  )
];
