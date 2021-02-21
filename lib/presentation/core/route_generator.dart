import 'package:flutter/material.dart';
import 'package:meditate/presentation/animations/page_transitions.dart';
import 'package:meditate/presentation/screens/player/player_screen.dart';
import 'app_scaffold.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;

    switch (routeSettings.name) {

      /// Authentication
      case "/":
        return MaterialPageRoute(builder: (_) => AppScaffold());
      case "/player":
        return createBottomToTopTransitionRoute(PlayerScreen());
      // return MaterialPageRoute(builder: (_) => PlayerScreen());

      default: // If Route Not Found => Error Route
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Error"),
        ),
        body: Center(
          child: Text("Page Not Found"),
        ),
      );
    });
  }
}
