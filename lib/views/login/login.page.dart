import 'package:exercise_1/controllers/login.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends GetResponsiveView<LoginController> {
  final String tag;

  LoginPage({super.key, required this.tag});

  @override
  Widget phone() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 21 / 9,
              child: Image.asset("assets/images/image001.png", scale: 5),
            ),
            SizedBox(
              width: 70.w,
              child: Column(
                children: [
                  getInputSection(
                      controller: controller.user_username,
                      leading: Icons.person,
                      helper: "Username"),
                  getInputSection(
                      controller: controller.user_password,
                      leading: Icons.key,
                      helper: "Password",
                      password: true),
                ],
              ),
            ),
            Divider(
              color: Colors.transparent,
            ),
            Obx(
              () => controller.logging_in.value
                  ? CircularProgressIndicator(
                      color: Color.fromRGBO(21, 68, 150, 1),
                    )
                  : getLoginButton(),
            ),
          ],
        ),
      ),
    );
  }

//Give TextField
//One function can serve multiple cases by only changing leading, helper and controller
  Widget getInputSection(
      {required TextEditingController controller,
      required IconData leading,
      required String helper,
      bool password = false}) {
    RxBool obscure = password.obs;

    return Padding(
      padding: EdgeInsets.all(5),
      child: Obx(
        () => TextField(
          controller: controller,
          obscureText: obscure.value,
          decoration: InputDecoration(
            helperText: helper,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            alignLabelWithHint: true,
            icon: Icon(
              leading,
              size: 20.sp,
              color: Color.fromRGBO(21, 68, 150, 1),
            ),
            //Add show/hide text icon onyl if the field is a password field
            suffixIcon: !password
                ? null
                : IconButton(
                    onPressed: obscure.toggle,
                    icon: Obx(
                      () => Icon(obscure.value
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget getLoginButton() {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.resolveWith((states) => 5),
      ),
      onPressed: controller.login,
      child: Text(
        "Login",
        style: TextStyle(
          fontSize: 13.sp,
          color: Color.fromRGBO(21, 68, 150, 1),
        ),
      ),
    );
  }
}
