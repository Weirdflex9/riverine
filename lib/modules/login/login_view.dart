import 'package:riverine/res/export.dart';
import 'package:riverine/util/image_util.dart';
import 'package:riverine/widget/custom_textfield.dart';
import 'package:riverine/widget/will_pop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import 'login_logic.dart';

class LoginPage extends StatelessWidget {
  final logic = Get.find<LoginLogic>();
  final state = Get.find<LoginLogic>().state;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: MyWillPop(
        isForbidBack: true,
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: FormBuilder(
            key: state.formKey,
            onChanged: logic.onFormChange,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              child: Padding(
                padding: EdgeInsets.only(
                  top: ScreenUtil().statusBarHeight + 120.w,
                  left: 80.w,
                  right: 80.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40.w),
                      child: LoadAssetImage(
                        'logo',
                        format: ImageFormat.jpg,
                        width: 180.w,
                        height: 180.w,
                      ),
                    ),
                    SizedBox(height: 120.w),
                    CustomTextField(
                      name: 'account',
                      hintText: 'Account'.tr,
                      keyboardType: TextInputType.emailAddress,
                      validator: FormBuilderValidators.required(errorText: 'account is required'.tr),
                    ),
                    SizedBox(height: 20.w),
                    CustomTextField(
                      name: 'password',
                      hintText: 'Password'.tr,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      validator: FormBuilderValidators.required(errorText: 'password is required'.tr),
                    ),
                    GetBuilder<LoginLogic>(
                        id: 'login_btn',
                        builder: (logic) {
                          return ElevatedBtn(
                            margin: EdgeInsets.only(top: 80.w),
                            size: Size(double.infinity, 90.w),
                            onPressed: (state.formKey.currentState?.isValid ?? false) ? logic.login : null,
                            radius: 15.w,
                            backgroundColor: (state.formKey.currentState?.isValid ?? false) ? Colours.primary : Colours.text_ccc,
                            text: 'Log In'.tr,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
