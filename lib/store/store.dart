import 'package:riverine/entity/user_entity.dart';
import 'package:riverine/res/export.dart';
import 'package:get/get.dart';

class StoreLogic extends GetxController {
  static StoreLogic get to => Get.find();
  final RxBool isLogin = false.obs;
  final RxObjectMixin<UserEntity> userEntity = UserEntity().obs;

  @override
  void onInit() {
    super.onInit();
    // whenInApp();
  }

  UserEntity? getUser() {
    if (!isLogin.value) {
      return null;
    }
    return userEntity.value;
  }

  Future<void> whenSignIn(UserEntity user) async {
    _changeLoginStatus(true);
    userEntity.value = user;
    await GetStorage().write(Constant.keyUser, userEntity);
  }

  Future<void> whenSignOut() async {
    GetStorage().remove(Constant.keyToken);
    // GetStorage().remove(Constant.keyUser);
    isLogin.value = false;
  }

  Future<void> whenInApp() async {
    if (GetStorage().hasData(Constant.keyToken) && GetStorage().hasData(Constant.keyUser)) {
      _changeLoginStatus(true);
      userEntity.value = UserEntity.fromJson(GetStorage().read<Map<String, dynamic>>(Constant.keyUser)!);
      final result = await Http().network<UserEntity>(
        Method.post,
        Api.userInfo,
      );
      if (result.success) {
        userEntity.value = result.content!;
        await GetStorage().write(Constant.keyUser, result.content!);
        _changeLoginStatus(true);
      } else {
        _changeLoginStatus(false);
      }
    } else {
      _changeLoginStatus(false);
    }
  }

  void _changeLoginStatus(bool flag) {
    if (isLogin.value != flag) {
      isLogin.value = flag;
    }
    update();
  }
}
