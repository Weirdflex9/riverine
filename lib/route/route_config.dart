import 'package:riverine/modules/home/article_detail/article_detail_binding.dart';
import 'package:riverine/modules/home/article_detail/article_detail_view.dart';
import 'package:riverine/modules/login/login_binding.dart';
import 'package:riverine/modules/login/login_view.dart';
import 'package:riverine/modules/main/main_binding.dart';
import 'package:riverine/modules/main/main_view.dart';
import 'package:riverine/modules/profile/camera_album/camera_album_binding.dart';
import 'package:riverine/modules/profile/camera_album/camera_album_view.dart';
import 'package:riverine/modules/profile/language/language_binding.dart';
import 'package:riverine/modules/profile/language/language_view.dart';
import 'package:riverine/modules/scan/scan_binding.dart';
import 'package:riverine/modules/scan/scan_view.dart';
import 'package:get/get.dart';

class RouteConfig {
  static const String main = '/page/main';
  static const String login = '/page/login';
  static const String scan = '/page/scan';
  static const String language = '/page/language';
  static const String articleDetail = '/page/articleDetail';
  static const String cameraAlbum = '/page/cameraAlbum';

  static final List<GetPage> getPages = [
    GetPage(name: main, page: () => MainPage(), binding: MainBinding()),
    GetPage(name: login, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(name: scan, page: () => ScanPage(), binding: ScanBinding()),
    GetPage(name: language, page: () => LanguagePage(), binding: LanguageBinding()),
    GetPage(name: articleDetail, page: () => ArticleDetailPage(), binding: ArticleDetailBinding()),
    GetPage(name: cameraAlbum, page: () => CameraAlbumPage(), binding: CameraAlbumBinding()),
  ];
}
