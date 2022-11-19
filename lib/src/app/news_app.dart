import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newsapp/src/app/extensions/context.dart';
import 'package:newsapp/src/app/routes/routes_constants.dart';
import 'package:newsapp/src/app/routes/routes_generator.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: context.l10n?.appName ?? "",
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesConstants.initial,
      onGenerateRoute: RoutesGenerator.generate,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
    );
  }
}
