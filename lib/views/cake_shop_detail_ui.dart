import 'package:flutter/material.dart';
import '../models/cake_shop.dart';
import '../services/shop_actions.dart';
import '../widgets/shop_image.dart';
import '../widgets/shop_map.dart';

class CakeShopDetailUI extends StatelessWidget {
  const CakeShopDetailUI(
      {super.key,
      required this.shop,
      required this.actions,
      required this.mapBuilder});
  final CakeShop shop;
  final ShopActions actions;
  final ShopMapBuilder mapBuilder;
  Future<void> _open(BuildContext context, Uri uri) async {
    final opened = await actions.open(uri);
    if (!opened && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content:
              Text('ไม่สามารถเปิดลิงก์ได้ โปรดตรวจสอบแอปและการเชื่อมต่อ')));
    }
  }

  Widget _photo(BuildContext context, int index, double width, double height) =>
      InkWell(
          onTap: () => showDialog<void>(
              context: context,
              builder: (ctx) => Dialog(
                  backgroundColor: Colors.transparent,
                  child: Stack(children: [
                    InteractiveViewer(
                        child: Image.asset(shop.images[index],
                            fit: BoxFit.contain)),
                    Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton.filled(
                            tooltip: 'ปิดรูปภาพ',
                            onPressed: () => Navigator.pop(ctx),
                            icon: const Icon(Icons.close)))
                  ]))),
          child: Semantics(
              button: true,
              label: 'ดูภาพเค้ก ${index + 1}',
              child:
                  ShopImage(shop.images[index], width: width, height: height)));
  Widget _section(String title, IconData icon, Color color, String value) =>
      Padding(
          padding: const EdgeInsets.only(bottom: 18),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Flexible(
                  child: Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 15))),
              const SizedBox(width: 5),
              Icon(icon, color: color, size: 17)
            ]),
            Text(value, style: const TextStyle(fontSize: 14, height: 1.45)),
          ]));
  Widget _link(BuildContext context, String label, Uri uri, IconData icon,
          Color color) =>
      InkWell(
          onTap: () => _open(context, uri),
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(children: [
                Icon(icon, color: color, size: 24),
                const SizedBox(width: 10),
                Expanded(
                    child: Text(label, style: const TextStyle(fontSize: 14))),
                const SizedBox(width: 8),
                const Icon(Icons.link, size: 20)
              ])));
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFFFF4438), title: Text(shop.name)),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 26, 24, 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: _photo(context, 0, 116, 80)),
                    const SizedBox(height: 18),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Flexible(child: _photo(context, 1, 120, 80)),
                      const SizedBox(width: 18),
                      Flexible(child: _photo(context, 2, 120, 80))
                    ]),
                    const SizedBox(height: 22),
                    _section(
                        'ชื่อร้าน', Icons.storefront, Colors.teal, shop.name),
                    _section('เวลาเปิดปิด', Icons.alarm, Colors.red,
                        shop.openCloseTime),
                    _section('รายละเอียดของร้าน', Icons.description_outlined,
                        Colors.teal, shop.description),
                    _section(
                        'ที่อยู่ของร้าน', Icons.flag, Colors.red, shop.address),
                    Center(
                        child: FilledButton.icon(
                            key: const Key('call-shop'),
                            onPressed: () => _open(context, shop.phoneUri),
                            style: FilledButton.styleFrom(
                                backgroundColor: const Color(0xFF4CAF50),
                                minimumSize: const Size(146, 36)),
                            icon: const Icon(Icons.call, size: 17),
                            label: Text(shop.phone))),
                    _link(context, shop.website, shop.websiteUri,
                        Icons.language, Colors.amber),
                    _link(context, shop.facebook, shop.facebookUri,
                        Icons.facebook, Colors.blue),
                    const SizedBox(height: 8),
                    SizedBox(
                        height: 340,
                        width: double.infinity,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(2),
                            child: mapBuilder(shop))),
                    TextButton.icon(
                        key: const Key('open-map'),
                        onPressed: () => _open(context, shop.mapUri),
                        icon: const Icon(Icons.open_in_new, size: 17),
                        label: const Text('เปิดแผนที่')),
                    const Text('ข้อมูลร้านและพิกัดเป็นตัวอย่างสำหรับการศึกษา',
                        style:
                            TextStyle(fontSize: 11, color: Color(0xFF77656C))),
                  ]))));
}
