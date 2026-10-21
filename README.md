# Assignment 06 — flutter_cake_shop_project

**Rajesh Kumar Upadhayay — Student ID 6819110001**

สายด่วนกินเค้ก / **CAKE CALL FAST** is a Flutter cake-shop directory based on the supplied coursework mockup.

## Screens and features

- `lib/views/splash_screen_ui.dart` — `SplashScreenUI`: cake background, Thai/English title and loading indicator; automatically opens the directory after two seconds.
- `lib/views/cake_shop_list_ui.dart` — `CakeShopListUI`: auto-sliding, swipeable photo banner and seven shop rows with thumbnails, telephone numbers and detail navigation.
- `lib/views/cake_shop_detail_ui.dart` — `CakeShopDetailUI`: three-photo gallery, shop information, opening hours, description, address, call button, website/Facebook links and an interactive OpenStreetMap marker.
- Tap a gallery photo to enlarge it. Pinch to zoom; close to return.
- A failed external link shows an actionable message. An unavailable map shows a connection notice and keeps the external map button available.
- Kanit is bundled locally, including Thai glyphs. The mobile layout is centered at a maximum width of 440 logical pixels and scrolls on smaller screens.

## Run

Requires Flutter 3.41 or newer with Dart 3.11 or newer (the committed lockfile resolves recent platform plugins).

```sh
flutter pub get
flutter run -d chrome
```

For Android/iOS, select a configured emulator or connected device and run `flutter run`. Android release builds include INTERNET permission for map tiles. Phone links need a device/application that handles `tel:`; a desktop browser may have no calling application. Website and Facebook actions open externally. No calls or purchases are made automatically.

On Windows, Flutter plugins require Developer Mode/symlink support for Windows desktop development. Android, iOS and web can be developed independently with the appropriate toolchains. Native platform builds require their respective SDKs; they have not been verified on this machine.

## Verification

```sh
flutter analyze
flutter test
flutter build web --no-web-resources-cdn
```

The six automated tests cover sample-data destinations, splash/list/detail/back navigation, selected-shop phone/web/Facebook/map URLs, failed-link feedback, gallery interaction, and scrolling without overflow on a 320 × 568 viewport. External actions and map widgets are injected in widget tests, so tests do not place calls or depend on live network services.

## Sample data and design fidelity

Reference: [Figma coursework mockup](https://www.figma.com/design/dDfSU6xj7OqYc8WXSyXXYm/Project--flutter_cake_shop_app?node-id=0-1).

The Figma connector could not retrieve editable design layers/assets because the shared file requires editor access. The supplied screenshots were used for the layout, colors, screen names and sample directory. The local resource folder supplied was `resource-flutter-thai-hotline-app`, whose contents are bank, emergency, travel and utility icons, not cake-shop assets. Consequently, this implementation bundles illustrative cake/bakery photographs instead of the unavailable original cake photographs and promotional collage. The splash and carousel imagery therefore differ from the screenshot. No Hotline icons are presented as cake photos.

Shop names and phone numbers follow the screenshot. Descriptions were adapted, and addresses, hours, links and coordinates are coursework examples; they are not a verified current business directory or navigation service. All seven records are centralized in `lib/data/cake_shops.dart` for easy replacement with authoritative information. This is a directory app, not an ordering or payment backend.

## Assets and attribution

- Cake/bakery photos: Unsplash, bundled locally. Individual download/source URLs are in `assets/sources.json`. [Unsplash license](https://unsplash.com/license). Images illustrate baked goods and do not claim to depict the named businesses.
- Kanit: Google Fonts, SIL Open Font License. See `assets/fonts/OFL.txt`.
- Interactive map: `flutter_map`, `latlong2`, © [OpenStreetMap contributors](https://www.openstreetmap.org/copyright). Map tiles require internet access. The in-app map includes attribution; the sample coordinates may differ from actual business locations.
- External links: `url_launcher`.
- Banner uses Flutter's `PageView` and a disposed periodic timer; no additional carousel dependency is necessary.

## Submit

Submit the GitHub repository link for Assignment 06:

https://github.com/vivekju14-lang/flutter_cake_shop_project

Suggested display text: **Assignment 06 — Rajesh Kumar Upadhayay — 6819110001**
