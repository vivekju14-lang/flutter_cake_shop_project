import 'package:flutter/material.dart';

class ShopImage extends StatelessWidget {
  const ShopImage(this.path,
      {super.key, this.width, this.height, this.fit = BoxFit.cover});
  final String path;
  final double? width, height;
  final BoxFit fit;
  @override
  Widget build(BuildContext context) => ClipRRect(
      borderRadius: BorderRadius.circular(7),
      child: Image.asset(path,
          width: width,
          height: height,
          fit: fit,
          errorBuilder: (_, error, stack) => SizedBox(
              width: width,
              height: height,
              child: const ColoredBox(
                  color: Color(0xFFF5DCE4),
                  child: Center(child: Icon(Icons.cake_outlined, size: 36))))));
}
