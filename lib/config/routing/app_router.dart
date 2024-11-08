import 'package:echoes/config/routing/routes.dart';
import 'package:echoes/core/di/di.dart';
import 'package:echoes/features/random_quote/presentation/cubits/get_random_quote_cubit/get_random_quote_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/favourite_quote/presentation/screens/favourite_quote_screen.dart';
import '../../features/random_quote/presentation/screens/home_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.randomQuoteRoute:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => BlocProvider(
            create: (BuildContext context) =>
                getIt.get<GetRandomQuoteCubit>()..getRandomQuote(),
            child: const HomeScreen(),
          ),
          transitionDuration: const Duration(milliseconds: 500),
        );
      case Routes.favouriteQuoteRoute:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const FavouriteQuoteScreen(),
          transitionDuration: const Duration(milliseconds: 500),
        );
      default:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
          transitionDuration: const Duration(milliseconds: 500),
        );
    }
  }
}
