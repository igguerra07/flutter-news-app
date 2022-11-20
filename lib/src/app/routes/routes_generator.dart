import 'package:flutter/material.dart';
import 'package:newsapp/src/app/features/news/presentation/pages/details/detais_page_params.dart';
import 'package:newsapp/src/app/routes/routes_constants.dart';
import 'package:newsapp/src/app/features/news/presentation/pages/details/details_page.dart';
import 'package:newsapp/src/app/features/news/presentation/pages/news/news_page.dart';

class RoutesGenerator {
  static Map<String, dynamic> _buildRoutes(RouteSettings settings) {
    return {
      RoutesConstants.news: (context) => const NewsPage(),
      RoutesConstants.initial: (context) => const NewsPage(),
      RoutesConstants.details: (context) => NewsDetailsPage(
            params: settings.arguments as DetailsPageParams,
          ),
    };
  }

  static Route? generate(RouteSettings settings) {
    final routes = _buildRoutes(settings);
    final buildPages = routes[settings.name];
    if (buildPages == null) return null;

    return PageRouteBuilder(
      pageBuilder: (context, __, ___) => buildPages(context),
      transitionsBuilder: _buildTransition,
    );
  }

  static Widget _buildTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.ease;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }
}
