import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'routes.dart';


class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.onboardingScreen,
    routes: [
      // GoRoute(
      //   path: Routes.onboardingScreen,
      //   builder: (context, state) => const OnboardingScreen(),
      // ),
      // GoRoute(
      //   path: Routes.loginScreen,
      //   builder: (context, state) => const LoginScreen(),
      // ),
      // GoRoute(
      //   path: Routes.homeScreen,
      //   builder: (context, state) => const HomeScreen(),
      // ),
      // Add more routes here...
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('No route defined for ${state.uri.toString()}'),
      ),
    ),
  );
}
