import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../models/cake_shop.dart';

typedef ShopMapBuilder = Widget Function(CakeShop shop);
Widget buildShopMap(CakeShop shop) => ShopMap(shop: shop);

class ShopMap extends StatefulWidget {
  const ShopMap({super.key, required this.shop});
  final CakeShop shop;
  @override
  State<ShopMap> createState() => _ShopMapState();
}

class _ShopMapState extends State<ShopMap> {
  bool _failed = false;
  void _onTileError() {
    if (!_failed && mounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() => _failed = true);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final point = LatLng(widget.shop.latitude, widget.shop.longitude);
    return Stack(children: [
      FlutterMap(
          options: MapOptions(
              initialCenter: point,
              initialZoom: 15,
              interactionOptions: const InteractionOptions(
                  flags: InteractiveFlag.drag |
                      InteractiveFlag.pinchZoom |
                      InteractiveFlag.doubleTapZoom)),
          children: [
            TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName:
                    'com.rajesh.assignment.flutter_cake_shop_project',
                errorTileCallback: (tile, error, stack) => _onTileError()),
            MarkerLayer(markers: [
              Marker(
                  point: point,
                  width: 46,
                  height: 46,
                  child: Tooltip(
                      message: widget.shop.name,
                      child: const Icon(Icons.location_pin,
                          size: 46, color: Colors.red)))
            ]),
            const SimpleAttributionWidget(
                source: Text('© OpenStreetMap contributors',
                    style: TextStyle(fontSize: 10))),
          ]),
      if (_failed)
        Positioned(
            left: 8,
            right: 8,
            top: 8,
            child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.white.withValues(alpha: .95),
                child: const Text(
                    'โหลดแผนที่ไม่ได้ โปรดตรวจสอบอินเทอร์เน็ต\nใช้ปุ่มเปิดแผนที่ด้านล่างได้',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12))))
    ]);
  }
}
