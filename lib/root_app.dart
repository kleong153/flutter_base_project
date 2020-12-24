import 'package:flutter/material.dart';
import 'package:flutter_base_project/app_router.dart';
import 'package:flutter_base_project/constants/app_constants/app_constants.dart' as appConst;
import 'package:flutter_base_project/generated/l10n.dart';
import 'package:flutter_base_project/utils/app_focus_helper.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class RootApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Tap anywhere to dismiss keyboard.
        AppFocusHelper.instance.requestUnfocus();
      },
      child: MaterialApp(
        localizationsDelegates: [
          Lang.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: Lang.delegate.supportedLocales,
        onGenerateTitle: (context) => Lang.of(context).app_title,
        theme: ThemeData(
          scaffoldBackgroundColor: appConst.kBackgroundMaterialColor,
          primarySwatch: appConst.kPrimaryMaterialColor,
          accentColor: appConst.kAccentColor,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: appConst.kTextMaterialColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: Theme.of(context).appBarTheme.copyWith(
                color: appConst.kAppBarBackgroundColor,
                textTheme: Theme.of(context).textTheme.apply(bodyColor: appConst.kAppBarTextColor),
                iconTheme: Theme.of(context).iconTheme.copyWith(color: appConst.kAppBarTextColor),
              ),
        ),
        initialRoute: AppRouter.splashScreen,
        onGenerateRoute: AppRouter.generatedRoute,
      ),
    );
  }
}
