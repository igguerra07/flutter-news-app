import 'package:flutter/material.dart';
import 'package:newsapp/src/app/di/injector.dart';
import 'package:newsapp/src/app/news_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const NewsApp());
}
