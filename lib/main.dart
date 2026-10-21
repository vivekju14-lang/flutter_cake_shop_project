import 'package:flutter/material.dart';
import 'services/shop_actions.dart';
import 'views/splash_screen_ui.dart';
import 'widgets/shop_map.dart';

void main() => runApp(const CakeShopApp());

const cakeRed = Color(0xFFFF0000);
const cakeBackground = Color(0xFFFFF7FF);

class CakeShopApp extends StatelessWidget {
  const CakeShopApp(
      {super.key,
      this.actions = const ShopActions(),
      this.mapBuilder = buildShopMap,
      this.splashDuration = const Duration(seconds: 2)});
  final ShopActions actions;
  final ShopMapBuilder mapBuilder;
  final Duration splashDuration;
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'สายด่วนกินเค้ก',
        theme: ThemeData(
            useMaterial3: true,
            fontFamily: 'Kanit',
            colorScheme: ColorScheme.fromSeed(seedColor: cakeRed),
            scaffoldBackgroundColor: cakeBackground,
            appBarTheme: const AppBarTheme(
                backgroundColor: cakeRed,
                foregroundColor: Colors.white,
                centerTitle: true,
                elevation: 0,
                titleTextStyle: TextStyle(
                    fontFamily: 'Kanit', fontSize: 21, color: Colors.white)),
            dividerColor: const Color(0xFFF8D9E3)),
        builder: (context, child) => ColoredBox(
            color: const Color(0xFFEDE9EC),
            child: Center(
                child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 440),
                    child: child))),
        home: SplashScreenUI(
            actions: actions, mapBuilder: mapBuilder, duration: splashDuration),
      );
}
