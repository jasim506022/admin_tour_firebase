// Import Necessary Package and Files

import 'package:bd_tour_firebase_admin/page/textform_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/const.dart';
import '../../const/gobalcolor.dart';
import 'textfieldformwidget.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> with TickerProviderStateMixin {
  // Text Edit Controller
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  // Global Key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Material(
        color: AppColors.grey.withOpacity(.2),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: mq.width * 0.3,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.red, width: 3)),
                    child: Column(
                      children: [
                        Text(
                          "Welcome   Back",
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
                        const SizedBox(height: 10,),
                        _buildLoginButton(),
                      ],
                    ),
                  ))
            ],
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
              controller: _emailController,
              validator: (emailText) {
                if (emailText!.isEmpty) {
                  return 'Enter Your Email Address';
                } else if (!globalMethod.isValidEmail(emailText)) {
                  return 'Please Enter a valid Email Address  please_enter_a_valid_email_address'
                      .tr;
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
                  return 'please_enter_your_password'.tr;
                } else if (passwordText.length < 6) {
                  return 'password_should_be_alphanumeric'.tr;
                }
                return null;
              },
              hintText: "enter_password".tr,
              controller: _passwordController,
            ),
            title: 'password'.tr,
          ),
        ],
      ),
    );
  }

  SizedBox _buildLoginButton() {
    return SizedBox(
      width: mq.width,
      child: CustomButtonWidget(
        onPressed: () async {
          /*
          if (!_formKey.currentState!.validate()) return;
          // bool isCheckInternet = await globalMethod.internetChecking();

          if (isCheckInternet) {
            loadingController.setLoading(false);
            globalMethod.errorDialog(
              animationAssets: AnimationAssets.noInternetAnimation,
              title: "no_internet".tr,
              content: "no_internet_message".tr,
              buttonText: "try_again".tr,
            );
          } else {
            loginViewModel.performLoginAction(
                _emailController.text, _passwordController.text);
          }

           */
        },
        buttonText: 'Log In',
      ),
    );
  }
}

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {super.key, required this.onPressed, required this.buttonText});

  final VoidCallback onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.greenColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(10),
          )),
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        ),
        onPressed: onPressed,
        icon: const Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
        label: Text(buttonText,
            style: GoogleFonts.poppins(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14)));
  }
}

/*
CustomButtonWidget(
        onPressed: () async {
          /*

          if (!_formKey.currentState!.validate()) return;
          bool isCheckInternet = await globalMethod.internetChecking();

          if (isCheckInternet) {
            loadingController.setLoading(false);
            globalMethod.errorDialog(
              animationAssets: AnimationAssets.noInternetAnimation,
              title: "no_internet".tr,
              content: "no_internet_message".tr,
              buttonText: "try_again".tr,
            );
          } else {
            loginViewModel.performLoginAction(
                _emailController.text, _passwordController.text);
          }

           */
        }, buttonText: 'Log In',
      ),
 */
