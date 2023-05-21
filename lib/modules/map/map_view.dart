import 'package:riverine/res/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'map_logic.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.put(MapLogic());
    final state = Get.find<MapLogic>().state;

    return Scaffold(
      appBar: TitleBar(
        title: 'Map'.tr,
      ),
      body: Container(),
    );
  }
}
