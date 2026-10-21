import 'dart:async';
import 'package:flutter/material.dart';
import '../services/shop_actions.dart';
import '../widgets/shop_map.dart';
import 'cake_shop_list_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI(
      {super.key,
      required this.actions,
      required this.mapBuilder,
      required this.duration});
  final ShopActions actions;
  final ShopMapBuilder mapBuilder;
  final Duration duration;
  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    _timer = Timer(widget.duration, () {
      if (mounted) {
        Navigator.of(context).pushReplacement(MaterialPageRoute<void>(
            builder: (_) => CakeShopListUI(
                actions: widget.actions, mapBuilder: widget.mapBuilder)));
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Stack(fit: StackFit.expand, children: [
        Image.asset('assets/images/cake_1.jpg',
            fit: BoxFit.cover, alignment: Alignment.centerRight),
        const DecoratedBox(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
              Color(0xEEFFFFFF),
              Color(0xBBFFFFFF),
              Color(0x00FFFFFF)
            ],
                    stops: [
              0,
              .4,
              .7
            ]))),
        SafeArea(
            child: Align(
                alignment: const Alignment(0, -.6),
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      const Text('สายด่วนกินเค้ก',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                              color: Colors.red)),
                      const SizedBox(height: 4),
                      const Text('CAKE CALL FAST',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.redAccent)),
                      const SizedBox(height: 26),
                      Semantics(
                          label: 'กำลังโหลดรายชื่อร้านเค้ก',
                          child: const SizedBox(
                              width: 34,
                              height: 34,
                              child: CircularProgressIndicator(
                                  color: Color(0xFF37474F), strokeWidth: 3))),
                    ]))))
      ]));
}
