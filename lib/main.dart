import 'package:flutter/material.dart';
import 'package:meditate/application/service_locator.dart';
import 'package:meditate/presentation/core/app_widget.dart';

void main() {
  setupLocator();
  runApp(App());
}
