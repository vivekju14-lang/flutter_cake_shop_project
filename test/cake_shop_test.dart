import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_cake_shop_project/main.dart';
import 'package:flutter_cake_shop_project/data/cake_shops.dart';
import 'package:flutter_cake_shop_project/models/cake_shop.dart';
import 'package:flutter_cake_shop_project/services/shop_actions.dart';
import 'package:flutter_cake_shop_project/views/cake_shop_list_ui.dart';
import 'package:flutter_cake_shop_project/views/cake_shop_detail_ui.dart';

class RecordingActions extends ShopActions {
  final opened = <Uri>[];
  bool succeeds = true;
  @override
  Future<bool> open(Uri uri) async {
    opened.add(uri);
    return succeeds;
  }
}

Widget fakeMap(CakeShop shop) => ColoredBox(
    color: Colors.blueGrey,
    child: Text('Map: ${shop.latitude}, ${shop.longitude}'));
Future<void> start(WidgetTester tester, RecordingActions actions) async {
  await tester.pumpWidget(CakeShopApp(
      actions: actions,
      mapBuilder: fakeMap,
      splashDuration: const Duration(milliseconds: 100)));
  await tester.pump(const Duration(milliseconds: 110));
  await tester.pumpAndSettle();
}

Future<void> finish(WidgetTester tester) async =>
    tester.pumpWidget(const SizedBox.shrink());
void main() {
  test('Seven unique sample shops have valid destinations', () {
    expect(cakeShops.length, 7);
    expect(cakeShops.map((s) => s.name).toSet().length, 7);
    for (final shop in cakeShops) {
      expect(shop.images.length, 3);
      expect(shop.phone, matches(RegExp(r'^0\d{8,9}$')));
      expect(shop.phoneUri.scheme, 'tel');
      expect(shop.websiteUri.scheme, 'https');
      expect(shop.facebookUri.host, 'www.facebook.com');
      expect(shop.latitude, inInclusiveRange(-90, 90));
      expect(shop.longitude, inInclusiveRange(-180, 180));
      expect(shop.mapUri.queryParameters['mlat'], '${shop.latitude}');
    }
  });
  testWidgets('Splash opens list, Larna House opens detail, back restores list',
      (tester) async {
    await tester.pumpWidget(
        CakeShopApp(actions: RecordingActions(), mapBuilder: fakeMap));
    expect(find.text('CAKE CALL FAST'), findsOneWidget);
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();
    expect(find.byType(CakeShopListUI), findsOneWidget);
    await tester.ensureVisible(find.byKey(const ValueKey('Larna House')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('Larna House')));
    await tester.pumpAndSettle();
    expect(find.byType(CakeShopDetailUI), findsOneWidget);
    expect(find.text('พัฒนาการ 61'), findsOneWidget);
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.byType(CakeShopListUI), findsOneWidget);
    await finish(tester);
  });
  testWidgets('All external actions dispatch selected shop destinations',
      (tester) async {
    final actions = RecordingActions();
    await start(tester, actions);
    await tester.tap(find.byKey(const ValueKey('Yellow Spoon Pastry')));
    await tester.pumpAndSettle();
    final shop = cakeShops.first;
    for (final finder in [
      find.byKey(const Key('call-shop')),
      find.text(shop.website),
      find.text(shop.facebook),
      find.byKey(const Key('open-map'))
    ]) {
      await tester.ensureVisible(finder);
      await tester.tap(finder);
      await tester.pump();
    }
    expect(actions.opened,
        [shop.phoneUri, shop.websiteUri, shop.facebookUri, shop.mapUri]);
    await finish(tester);
  });
  testWidgets('Failed link shows recovery message', (tester) async {
    final actions = RecordingActions()..succeeds = false;
    await start(tester, actions);
    await tester.tap(find.byKey(const ValueKey('Yellow Spoon Pastry')));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byKey(const Key('call-shop')));
    await tester.tap(find.byKey(const Key('call-shop')));
    await tester.pumpAndSettle();
    expect(find.text('ไม่สามารถเปิดลิงก์ได้ โปรดตรวจสอบแอปและการเชื่อมต่อ'),
        findsOneWidget);
    await finish(tester);
  });
  testWidgets('Gallery opens and closes', (tester) async {
    await start(tester, RecordingActions());
    await tester.tap(find.byKey(const ValueKey('Yellow Spoon Pastry')));
    await tester.pumpAndSettle();
    await tester.tap(find.bySemanticsLabel('ดูภาพเค้ก 1'));
    await tester.pumpAndSettle();
    expect(find.byType(InteractiveViewer), findsOneWidget);
    await tester.tap(find.byTooltip('ปิดรูปภาพ'));
    await tester.pumpAndSettle();
    expect(find.byType(InteractiveViewer), findsNothing);
    await finish(tester);
  });
  testWidgets('320 pixel phone has no overflow and final shop is reachable',
      (tester) async {
    tester.view.physicalSize = const Size(320, 568);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await start(tester, RecordingActions());
    await tester.scrollUntilVisible(
        find.byKey(const ValueKey('Bake Ministry')), 250,
        scrollable: find.byType(Scrollable).first);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('Bake Ministry')));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byKey(const Key('open-map')));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    await finish(tester);
  });
}
