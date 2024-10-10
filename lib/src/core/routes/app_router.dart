import "package:coder_shifu/src/feature/entry/view/pages/on_boarding_page.dart";
import "package:coder_shifu/src/feature/entry/view/pages/splash_page.dart";
import "package:coder_shifu/src/feature/book/view/pages/book.dart";
import "package:coder_shifu/src/feature/news/view/pages/news.dart";
import "package:coder_shifu/src/feature/profile/view/pages/profile.dart";
import "package:coder_shifu/src/feature/subject/view/pages/modules.dart";
import "package:coder_shifu/src/feature/subject/view/pages/lesson.dart";
import "package:coder_shifu/src/feature/subject/view/pages/module_lessons.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "../../data/entity/subject.dart";
import "../../feature/home_navigation.dart";
import "../../feature/subject/view/pages/subject.dart";
import "app_route_name.dart";

final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell-key');

final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell-key');

@immutable
final class AppRouter {
  const AppRouter._();

  static final GoRoute modules = GoRoute(
      parentNavigatorKey: appNavigatorKey,
      path: AppRouteName.module,
      pageBuilder: (BuildContext context, GoRouterState state) => MaterialPage(
        child: Modules(argument: state.extra as Fan),
      ),
      routes: [moduleLessons]);

  static final GoRoute moduleLessons = GoRoute(
      parentNavigatorKey: appNavigatorKey,
      path: AppRouteName.moduleLessons,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return MaterialPage(child: ModuleLessons(argument: state.extra! as Fan));
      },
      routes: [lesson]);

  static final GoRoute lesson = GoRoute(
    parentNavigatorKey: appNavigatorKey,
    path: AppRouteName.lesson,
    pageBuilder: (BuildContext context, GoRouterState state) {
      return  MaterialPage(child: Lesson(extra: state.extra as Fan));
    },
  );


  static final GoRouter router = GoRouter(
    navigatorKey: appNavigatorKey,
    initialLocation: AppRouteName.splash,
    routes: [
      GoRoute(
        path: AppRouteName.splash,
        builder: (context, state) => const SplashPage(),
      ),

      GoRoute(
        path: AppRouteName.welcomePage,
        builder: (context, state) => const OnBoardingPage(),
      ),

      /// Patient Shell Route
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: appNavigatorKey,
        builder: (context, state, navigationShell) {
          return HomeNavigation(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorKey,
            routes: [
              GoRoute(
                path: AppRouteName.subject,
                pageBuilder: (context, state) => const NoTransitionPage(child: Subject()),
                routes: [modules],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRouteName.books,
                pageBuilder: (context, state) => const NoTransitionPage(child: Book()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRouteName.news,
                pageBuilder: (context, state) => const NoTransitionPage(child: News()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRouteName.profile,
                pageBuilder: (context, state) => const NoTransitionPage(child: Profile()),
              ),
            ],
          ),

          // StatefulShellBranch(
          //   routes: [
          //     GoRoute(
          //       path: AppRoute.results,
          //       pageBuilder: (context, state) =>
          //       const NoTransitionPage(child: Scaffold()),
          //     ),
          //   ],
          // ),
        ],
      ),
    ],
  );
}

// GlobalKey<NavigatorState> parentNavigatorKey = GlobalKey<NavigatorState>(debugLabel: "root");
//
// @immutable
// final class AppRouter {
//   const AppRouter._();
//
//   static final GoRoute homeDetailPage = GoRoute(
//     parentNavigatorKey: parentNavigatorKey,
//     path: AppRouteName.homeDetail,
//     pageBuilder: (BuildContext context, GoRouterState state) => _customEachTransitionAnimation(context, state, const HomeDetail()),
//     routes: const [],
//   );
//
//   static final GoRoute searchDetail = GoRoute(
//     path: AppRouteName.searchDetail,
//     pageBuilder: (BuildContext context, GoRouterState state) => _customEachTransitionAnimation(context, state, const SearchDetail()),
//   );
//
//   static final GoRoute search = GoRoute(
//     path: AppRouteName.search, // Ensure the path is set correctly
//     pageBuilder: (BuildContext context, GoRouterState state) => _customEachTransitionAnimation(context, state, const Search()),
//     routes: [searchDetail], // Keep detail page routing under search
//   );
//
//   static GoRouter routes = GoRouter(
//     initialLocation: AppRouteName.splash,
//     navigatorKey: parentNavigatorKey,
//     debugLogDiagnostics: true,
//     routes: <RouteBase>[
//       GoRoute(
//         name: "SplashPage",
//         path: AppRouteName.splash,
//         builder: (BuildContext context, GoRouterState state) => const SplashPage(),
//       ),
//       GoRoute(
//         name: "Welcome",
//         path: AppRouteName.welcomePage,
//         builder: (BuildContext context, GoRouterState state) => const OnBoardingPage(),
//       ),
//       ShellRoute(
//         builder: (context, state, child) => MainPage(child: child), // Main page with bottom nav
//         routes: [
//           GoRoute(
//             name: "HomePage",
//             path: AppRouteName.home,
//             pageBuilder: (BuildContext context, GoRouterState state) => _customNavigatorTransitionAnimation(context, state, const Home()),
//             routes: [homeDetailPage],
//           ),
//           search, // This remains within the ShellRoute
//           GoRoute(
//             name: "Favorite",
//             path: AppRouteName.favorite,
//             pageBuilder: (BuildContext context, GoRouterState state) => _customNavigatorTransitionAnimation(context, state, const Favorite()),
//             routes: [searchDetail],
//           ),
//           GoRoute(
//             name: "Profile",
//             path: AppRouteName.profile,
//             pageBuilder: (BuildContext context, GoRouterState state) => _customNavigatorTransitionAnimation(context, state, const Profile()),
//             routes: [searchDetail],
//           ),
//         ],
//       ),
//     ],
//   );
//
//   static Page<dynamic> _customEachTransitionAnimation(BuildContext context, GoRouterState state, Widget child) => CustomTransitionPage<Object>(
//         transitionsBuilder: (
//           BuildContext context,
//           Animation<double> animation,
//           Animation<double> secondaryAnimation,
//           Widget child,
//         ) {
//           // var begin = Offset(1.0, 0.0); // From right
//           // var end = Offset.zero;
//           // var tween = Tween(begin: begin, end: end);
//           // var offsetAnimation = animation.drive(tween);
//           //
//           // return SlideTransition(
//           //   position: offsetAnimation,
//           //   child: child,
//           // );
//
//           final tween = Tween<double>(begin: 0, end: 1);
//           final scaleAnimation = animation.drive(tween);
//
//           return ScaleTransition(
//             scale: scaleAnimation,
//             child: child,
//           );
//
//           // var tween = Tween<double>(begin: 0.6, end: 1.0);
//           // var sizeAnimation = animation.drive(tween);
//           //
//           // return SizeTransition(
//           //   sizeFactor: sizeAnimation,
//           //   child: child,
//           // );
//
//           // var tween = Tween<double>(begin: 0.5, end: 1); // Full rotation
//           // var rotationAnimation = animation.drive(tween);
//           //
//           // return RotationTransition(
//           //   turns: rotationAnimation,
//           //   child: child,
//           // );
//
//           // return FadeTransition(
//           //   opacity: animation,
//           //   child: child,
//           // );
//         },
//         child: child,
//       );
//
//   static Page<dynamic> _customNavigatorTransitionAnimation(BuildContext context, GoRouterState state, Widget child) => CustomTransitionPage<Object>(
//         transitionsBuilder: (
//           BuildContext context,
//           Animation<double> animation,
//           Animation<double> secondaryAnimation,
//           Widget child,
//         ) {
//           // var begin = Offset(1.0, 0.0); // From right
//           // var end = Offset.zero;
//           // var tween = Tween(begin: begin, end: end);
//           // var offsetAnimation = animation.drive(tween);
//           //
//           // return SlideTransition(
//           //   position: offsetAnimation,
//           //   child: child,
//           // );
//
//           // var tween = Tween<double>(begin: 0, end: 1);
//           // var scaleAnimation = animation.drive(tween);
//           //
//           // return ScaleTransition(
//           //   scale: scaleAnimation,
//           //   child: child,
//           // );
//
//           final tween = Tween<double>(begin: 0.6, end: 1);
//           final sizeAnimation = animation.drive(tween);
//
//           return SizeTransition(
//             sizeFactor: sizeAnimation,
//             child: child,
//           );
//
//           // final tween = Tween<double>(begin: 0.5, end: 1); // Full rotation
//           // final rotationAnimation = animation.drive(tween);
//
//           // return RotationTransition(
//           //   turns: rotationAnimation,
//           //   child: child,
//           // );
//
//           // return FadeTransition(
//           //   opacity: animation,
//           //   child: child,
//           // );
//         },
//         child: child,
//       );
// }
