import 'package:delivery_app/screens/ConfigurationScreen.dart';
import 'package:delivery_app/screens/EditProfile.dart';
import 'package:delivery_app/screens/Home.dart';
import 'package:delivery_app/screens/Settings.dart';
import 'package:delivery_app/screens/SplashScreen.dart';
import 'package:delivery_app/screens/login.dart';
import 'package:go_router/go_router.dart';

GoRouter routerConfig = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const Login(),
    ),
    GoRoute(
      path: '/config',
      builder: (context, state) => const SettingsScreen(),
      routes: [
        GoRoute(
          path: 'editprofile', // Removed the leading slash
          builder: (context, state) => const Editprofile(),
        ),
        GoRoute(
          path: 'configscreen',
          builder: (context, state) => const ConfigurationScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/configscreen',
      builder: (context, state) => const ConfigurationScreen(),
    ),
    GoRoute(
      path: '/food/:id',
      builder: (context, state) {
        final namePath = state.pathParameters['id'];
        print(namePath);
        return FoodDetails(
          key: state.pageKey,
          idRestauranteRecibido: namePath.toString(),
        );
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return Home(
          key: state.pageKey,
          navigationShell: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) {
              return HomeFinal(key: state.pageKey);
            },
            routes: [
              GoRoute(
                path: ":id",
                builder: (context, state) {
                  return HomeFinal(
                    key: state.pageKey,
                    nombre: state.pathParameters['id'].toString(),
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: "/busqueda",
            builder: (context, state) {
              return SearchTest(
                key: state.pageKey,
              );
            },
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/favorites',
            builder: (context, state) {
              return FavoriteItem(key: state.pageKey);
            },
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/cart',
            builder: (context, state) {
              return CartItem(key: state.pageKey);
            },
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/settings',
            builder: (context, state) {
              return SettingsScreen(key: state.pageKey);
            },
          ),
        ]),
      ],
    ),
  ],
);
