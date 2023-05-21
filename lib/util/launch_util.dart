import 'package:riverine/res/export.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchUtil {
  static void launchUrl(String value) async {
    if (await canLaunch(value)) {
      await launch(value);
    } else {
      Toast.show('不能打开 $value');
    }
  }
}