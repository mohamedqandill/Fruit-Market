import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/core/routes_manager/routes.dart';
import 'package:responsive_adaptive_ui/features/auth/presentation/view/forget_password_screen.dart';
import 'package:responsive_adaptive_ui/features/auth/presentation/view/otp_screen.dart';
import 'package:responsive_adaptive_ui/features/checkout/presentation/view/checkout_screen.dart';
import 'package:responsive_adaptive_ui/features/checkout/presentation/view/order_error_screen.dart';
import 'package:responsive_adaptive_ui/features/checkout/presentation/view/order_tracking_screen.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/main_layout.dart';
import 'package:responsive_adaptive_ui/features/onBoarding/presentation/view/on_boarding_view.dart';
import 'package:responsive_adaptive_ui/features/splash/presentation/view/splash_view.dart';

import '../../features/auth/presentation/view/auth_screen.dart';
import '../../features/auth/presentation/view/sign_in_screen.dart';
import '../../features/auth/presentation/view/sign_up_screen.dart';
import '../../features/checkout/presentation/view/order_confirmation_screen.dart';
import '../../features/main_layouts/more/presentation/view/more_screen.dart';
import '../../features/main_layouts/more/presentation/widgets/contact_us_screen.dart';
import '../../features/main_layouts/more/presentation/widgets/my_favourite_screen.dart';
import '../../features/main_layouts/more/presentation/widgets/my_order_screen.dart';
import '../../features/main_layouts/more/presentation/widgets/profile_screen.dart';
import '../../features/main_layouts/more/presentation/widgets/terms_screen.dart';
import '../../features/product_details/presentation/view/product_details_screen.dart';
import '../../features/seller_details/presentation/view/seller_details_screen.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.orderTrackRoute:
        return MaterialPageRoute(builder: (_) => const OrderTrackingScreen());
      case Routes.orderErrorRoute:
        return MaterialPageRoute(builder: (_) => const OrderErrorScreen());
      case Routes.orderConfRoute:
        return MaterialPageRoute(
            builder: (_) => const OrderConfirmationScreen());
      case Routes.checkoutRoute:
        return MaterialPageRoute(builder: (_) => const CheckoutScreen());
      case Routes.termsRoute:
        return MaterialPageRoute(builder: (_) => const TermsScreen());
      case Routes.myFavoriteRoute:
        return MaterialPageRoute(builder: (_) => const MyFavouriteScreen());
      case Routes.profileRoute:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case Routes.contactRoute:
        return MaterialPageRoute(builder: (_) => const ContactUsScreen());
      case Routes.myOrderRoute:
        return MaterialPageRoute(builder: (_) => const MyOrderScreen());
      case Routes.moreRoute:
        return MaterialPageRoute(builder: (_) => const MoreScreen());
      case Routes.productDetailsRoute:
        return MaterialPageRoute(builder: (_) => const ProductDetailsScreen());
      case Routes.sellerRoute:
        return MaterialPageRoute(builder: (_) => const SellerDetailsScreen());
      case Routes.mainLayoutRoute:
        return MaterialPageRoute(builder: (_) => const MainLayoutScreen());
      case Routes.otpRoute:
        return MaterialPageRoute(builder: (_) => const OtpScreen());
      case Routes.forgetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case Routes.signupRoute:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case Routes.authRoute:
        return MaterialPageRoute(builder: (_) => const AuthScreen());
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
