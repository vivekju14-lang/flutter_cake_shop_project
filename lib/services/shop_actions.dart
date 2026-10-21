import 'package:url_launcher/url_launcher.dart';

/// Injectable boundary: tests record destinations without placing calls or opening browsers.
class ShopActions {
  const ShopActions();
  Future<bool> open(Uri uri) async {
    try {
      return await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {
      return false;
    }
  }
}
