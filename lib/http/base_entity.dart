import 'package:riverine/config/constant.dart';
import 'package:riverine/generated/json/base/json_convert_content.dart';
import 'package:riverine/util/object_util.dart';

class BaseEntity<T> {
  int? code;
  late String message;
  T? content;

  BaseEntity(this.code, this.message, this.content);

  bool get success => [0].contains(code);

  bool get strictSuccess => [0].contains(code) && ObjectUtil.isNotEmpty(content); //严格模式的返回成功

  BaseEntity.fromJson(Map<String, dynamic> json) {
    code = json[Constant.code] as int?;
    message = json[Constant.message] as String;
    if (json.containsKey(Constant.data)&& json[Constant.data] != null && json[Constant.data] != '') {
      content = _generateOBJ<T>(json[Constant.data] as Object);
    }
  }

  T? _generateOBJ<T>(Object json) {
    if (T.toString() == 'String') {
      return json.toString() as T;
    } else if (T.toString() == 'Map<dynamic, dynamic>') {
      return json as T;
    } else {
      /// List类型数据由fromJsonAsT判断处理
      return JsonConvert.fromJsonAsT<T>(json);
    }
  }
}
