import 'package:flutter/material.dart';
import 'package:meditate/presentation/screens/home/home_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;

    switch (routeSettings.name) {

      /// Authentication
      case "/":
        return MaterialPageRoute(builder: (_) => HomeScreen());
      // case "/addScenario":
      //   return MaterialPageRoute(builder: (_) => ScenarioAddPage());
      // case "/createEvent":
      //   return MaterialPageRoute(builder: (_) => CreateEventPage());

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
