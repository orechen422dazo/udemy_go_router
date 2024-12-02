import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:udemy_go_router/detail_page.dart';
import 'package:udemy_go_router/home_page.dart';
import 'package:udemy_go_router/login_page.dart';
import 'package:udemy_go_router/sessions.dart';
import 'package:udemy_go_router/splash_page.dart';

/// The route configuration.
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    /// TOP LEVEL PATH
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (BuildContext context, GoRouterState state) => const SplashPage(),
    ),
    /// TOP LEVEL PATH
    GoRoute(
        path: '/login/redirection',
        name: 'login-redirection',
        redirect: (BuildContext context, GoRouterState state) async {
          if (await checkedLoggedIn()) {
            return '/home';
          } else {
            return '/login';
          }
        }),
    /// Page
    GoRoute(
        path: '/home',
        name: 'home',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: const HomePage(),
      ),
      routes: [
        GoRoute(
          path: 'detail/:id',  // /home/detail/:id となる
          name: 'detail',
          builder: (context, state) => DetailPage(
            id: state.pathParameters['id']!,
          ),
        ),
      ],
    ),
    /// Login
    GoRoute(
        path: '/login',
        name: 'login',
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          restorationId: state.pageKey.value,
          child: const LoginPage(),
        ),
      // builder: (context, state) => const LoginPage(),
    ),
  ],
);