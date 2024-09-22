import 'package:bd_tour_firebase_admin/res/apps_colors.dart';
import 'package:bd_tour_firebase_admin/res/assets/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../../controller/login_controller.dart';
import '../../res/apps_function.dart';
import '../../res/constant.dart';
import '../../widget/responsive.dart';
import '../../widget/textfieldformwidget.dart';
import '../../widget/textform_title_widget.dart';
import 'widget/login_button_widget.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> with TickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final LoginController loginController = Get.find();

  @override
  void initState() {
    loginController.navigateToNextPage(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Responsive.isMobile(context) ? 10 : 20,
              vertical: Responsive.isMobile(context) ? 10 : 20),
          child: Center(
            child: SingleChildScrollView(
              child: SizedBox(
                  width: Responsive.isMobile(context)
                      ? ConstantData.mq.width * .6
                      : Responsive.isTablet(context)
                          ? ConstantData.mq.width * .4
                          : ConstantData.mq.width * 0.3,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: AppColors.red, width: 3)),
                    child: Column(
                      children: [
                        Text(
                          "Welcome Back",
                          style: GoogleFonts.poppins(
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                              color: AppColors.red),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Login with Admin",
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: AppColors.black),
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
              icon: ImageAssets.passwordIcon,
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
            title: 'password',
          ),
        ],
      ),
    );
  }

  SizedBox _buildLoginButton(BuildContext context) {
    return SizedBox(
      width: ConstantData.mq.width,
      child: LoginButtonWidget(
        onPressed: () async {
          if (!_formKey.currentState!.validate()) return;
          loginController.loginButton(context);
        },
        buttonText: 'Log In',
      ),
    );
  }
}
