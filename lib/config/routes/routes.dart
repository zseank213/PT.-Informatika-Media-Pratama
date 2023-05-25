import 'package:flutter/material.dart';
import 'package:ptinformatikamediapratama/lib.dart';

const routeLogin = "/login";
const routeOnBoarding = "/onBoarding";
const routeHome = "/home";
const routeDetailFAQ = "/detail-faq";

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routeLogin:
      return SmoothAnimationRoute(const LoginView());
    case routeHome:
      return SmoothAnimationRoute(const HomeView());
    case routeDetailFAQ:
      return SmoothAnimationRoute(
        DetailFAQView(
          faqId: settings.arguments as DetailFAQParram,
        ),
      );
  }
  return MaterialPageRoute(
    builder: (context) => const SplashScreenView(),
  );
}

//
Map<String, Widget Function(BuildContext context)> routes = {
  // ModalRoute.of(context)!.settings.arguments as
  // routeLogin: (context) => LoginView(),
};
