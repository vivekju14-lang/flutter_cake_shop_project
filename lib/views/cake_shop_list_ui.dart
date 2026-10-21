import 'package:flutter/material.dart';
import '../data/cake_shops.dart';
import '../services/shop_actions.dart';
import '../widgets/shop_map.dart';
import '../widgets/shop_image.dart';
import '../widgets/cake_banner.dart';
import 'cake_shop_detail_ui.dart';

class CakeShopListUI extends StatelessWidget {
  const CakeShopListUI(
      {super.key, required this.actions, required this.mapBuilder});
  final ShopActions actions;
  final ShopMapBuilder mapBuilder;
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text('สายด่วนกินเค้ก')),
      body: ListView(children: [
        const CakeBanner(),
        ...cakeShops.map((shop) => Column(children: [
              ListTile(
                  key: ValueKey(shop.name),
                  minTileHeight: 88,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                  leading: ShopImage(shop.images.first, width: 72, height: 54),
                  title: Text(shop.name, style: const TextStyle(fontSize: 16)),
                  subtitle: Text(shop.phone,
                      style: const TextStyle(
                          fontSize: 14, color: Color(0xFF50434A))),
                  trailing: const Icon(Icons.info,
                      color: Color(0xFFE52B34), size: 23),
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute<void>(
                          builder: (_) => CakeShopDetailUI(
                              shop: shop,
                              actions: actions,
                              mapBuilder: mapBuilder)))),
              const Divider(height: 1, thickness: 1),
            ])),
        const Padding(
            padding: EdgeInsets.all(16),
            child: Text('ข้อมูลตัวอย่างเพื่อการศึกษา',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Color(0xFF76656D))))
      ]));
}
