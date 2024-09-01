import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../../../const/const.dart';
import '../../controller/login_controller.dart';
import '../../res/apps_function.dart';
import '../responsive.dart';
import '../textfieldformwidget.dart';
import '../textform_title_widget.dart';
import 'widget/custom_button_widget.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> with TickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Material(
        color: bgColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Center(
            child: SingleChildScrollView(
              child: SizedBox(
                  width: Responsive.isMobile(context)
                      ? mq.width * .6
                      : Responsive.isTablet(context)
                          ? mq.width * .4
                          : mq.width * 0.3,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.red, width: 3)),
                    child: Column(
                      children: [
                        Text(
                          "Welcome Back",
                          style: GoogleFonts.poppins(
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                              color: Colors.red),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Login with Admin",
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        _buildLoginForm(),
                        const SizedBox(
                          height: 10,
                        ),
                        _buildLoginButton(context),
                      ],
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }

  Form _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormTitleWidget(
            textFieldWidget: TextFieldFormWidget(
              autofocus: false,
              hintText: 'Enter Your Email Address',
              controller: loginController.emailTEC,
              validator: (emailText) {
                if (emailText!.isEmpty) {
                  return 'Enter Your Email Address';
                } else if (!AppsFunction.isValidEmail(emailText)) {
                  return 'Please Enter a valid Email Address  please_enter_a_valid_email_address';
                }
                return null;
              },
              textInputType: TextInputType.emailAddress,
            ),
            title: 'Email',
          ),
          TextFormTitleWidget(
            textFieldWidget: TextFieldFormWidget(
              icon: "asset/svg/password.svg",
              autofocus: false,
              isShowPassword: true,
              obscureText: true,
              validator: (passwordText) {
                if (passwordText!.isEmpty) {
                  return 'please enter your password';
                } else if (passwordText.length < 6) {
                  return 'password should be getter then 6 character ';
                }
                return null;
              },
              hintText: "enter password",
              controller: loginController.passwordTEC,
            ),
            title: 'password'.tr,
          ),
        ],
      ),
    );
  }

  SizedBox _buildLoginButton(BuildContext context) {
    return SizedBox(
      width: mq.width,
      child: CustomButtonWidget(
        onPressed: () async {
          if (!_formKey.currentState!.validate()) return;
          loginController.loginButton(context);
        },
        buttonText: 'Log In',
      ),
    );
  }
}
