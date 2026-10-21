import 'dart:async';
import 'package:flutter/material.dart';
import '../data/cake_shops.dart';

class CakeBanner extends StatefulWidget {
  const CakeBanner({super.key});
  @override
  State<CakeBanner> createState() => _CakeBannerState();
}

class _CakeBannerState extends State<CakeBanner> {
  final _controller = PageController();
  Timer? _timer;
  int _page = 0;
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (_controller.hasClients) {
        _controller.animateToPage((_page + 1) % bannerImages.length,
            duration: const Duration(milliseconds: 450),
            curve: Curves.easeInOut);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AspectRatio(
      aspectRatio: 2.05,
      child: Stack(children: [
        PageView.builder(
            controller: _controller,
            itemCount: bannerImages.length,
            onPageChanged: (value) => setState(() => _page = value),
            itemBuilder: (_, index) => Semantics(
                label: 'ภาพเค้ก ${index + 1} จาก ${bannerImages.length}',
                child: Image.asset(bannerImages[index], fit: BoxFit.cover))),
        Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    bannerImages.length,
                    (i) => Semantics(
                        label: 'แบนเนอร์ ${i + 1}',
                        selected: _page == i,
                        child: GestureDetector(
                            onTap: () => _controller.animateToPage(i,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut),
                            child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                width: _page == i ? 19 : 7,
                                height: 7,
                                decoration: BoxDecoration(
                                    color:
                                        _page == i ? Colors.red : Colors.white,
                                    borderRadius:
                                        BorderRadius.circular(4))))))))
      ]));
}
