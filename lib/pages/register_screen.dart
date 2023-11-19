import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:movie_booking/components/buttons/text_button.dart';
import 'package:movie_booking/components/colors.dart';
import 'package:movie_booking/components/static_decoration.dart';
import 'package:movie_booking/controllers/auth_controller.dart';
import 'package:movie_booking/widget/text_widgets/input_text_field_widget.dart';
import '../components/app_text_style.dart';
import '../utils/gradient_text.dart';
import '../utils/validators.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  AuthController authController = Get.put(AuthController());
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryWhite,
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: registerFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                customHeight(60),
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Color(0xff6320EE),
                    ),
                  ),
                ),
                SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: Lottie.asset('assets/jsons/myMovieAppLogo.json'),
                ),
                Text(
                  "Welcome to",
                  style: AppTextStyle.normalBold20.copyWith(
                    foreground: Paint()..shader = linearGradientText,
                  ),
                ),
                Text(
                  "MOVIE BOOKING",
                  style: AppTextStyle.normalBold32.copyWith(
                    foreground: Paint()..shader = linearGradientText,
                  ),
                  textAlign: TextAlign.center,
                ),
                customHeight(20),
                Container(
                  width: double.infinity,
                  // height: Get.height * 0.5,
                  // constraints: BoxConstraints(
                  //   maxHeight: Get.height * 0.54,
                  // ),

                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xffC99EE6),
                      gradient: const LinearGradient(
                          colors: <Color>[Color(0xff251977), Color(0xff6320EE)],
                          end: Alignment.topRight,
                          begin: Alignment.topLeft)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "REGISTER",
                        style: AppTextStyle.regularBold.copyWith(fontSize: 30),
                      ),
                      height10,
                      textFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        controller: authController.registerNameController,
                        textStyle: AppTextStyle.normalRegular14.copyWith(
                          color: primaryWhite,
                        ),
                        hintText: "Name",
                        hintStyle: AppTextStyle.normalRegular15.copyWith(
                          color: primaryWhite,
                        ),
                        cursorColor: primaryWhite,
                        borderColor: primaryWhite,
                        borderRaduis: 8.0,
                        filledColor: primaryWhite.withOpacity(0.2),
                        prefixIcon: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Icon(
                              Icons.person,
                              color: primaryWhite,
                              size: 20,
                            )),
                        // hintText: "Username",
                        border: const BorderSide(color: primaryWhite),
                        validator: (value) =>
                            Validators.validateRequired(value!, "Name"),
                      ),
                      height10,
                      textFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        controller: authController.registerEmailController,
                        textStyle: AppTextStyle.normalRegular14.copyWith(
                          color: primaryWhite,
                        ),
                        hintText: "Email",
                        hintStyle: AppTextStyle.normalRegular15.copyWith(
                          color: primaryWhite,
                        ),
                        cursorColor: primaryWhite,
                        borderColor: primaryWhite,
                        borderRaduis: 8.0,
                        filledColor: primaryWhite.withOpacity(0.2),
                        prefixIcon: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Icon(
                              Icons.email_rounded,
                              color: primaryWhite,
                              size: 20,
                            )),
                        // hintText: "Username",
                        border: const BorderSide(color: primaryWhite),
                        validator: (value) => Validators.validateEmail(value!),
                      ),
                      height10,
                      Obx(
                        () => textFormField(
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          controller: authController.registerPasswordController,
                          textStyle: AppTextStyle.normalRegular14.copyWith(
                            color: primaryWhite,
                          ),
                          hintText: "Password",
                          hintStyle: AppTextStyle.normalRegular15.copyWith(
                            color: primaryWhite,
                          ),
                          obscureText: !authController.passwordVisible.value,
                          maxLines: 1,
                          suffixIcon: IconButton(
                            onPressed: () {
                              authController.passwordVisible.value =
                                  !authController.passwordVisible.value;
                            },
                            icon: Icon(
                                !authController.passwordVisible.value
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                size: 20,
                                color: primaryWhite),
                          ),
                          cursorColor: primaryWhite,
                          borderColor: primaryWhite,
                          borderRaduis: 8.0,
                          filledColor: primaryWhite.withOpacity(0.2),
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Icon(
                              Icons.lock,
                              size: 20,
                              color: primaryWhite,
                            ),
                          ),
                          border: const BorderSide(color: primaryWhite),
                          validator: (value) =>
                              Validators.validatePassword(value!),
                        ),
                      ),
                      height15,
                      Obx(
                        () => PrimaryTextButton(
                          loadingState: authController.registerAuthState.value,
                          title: "Register",
                          onPressed: () {
                            if (registerFormKey.currentState!.validate()) {
                              authController.register();
                            }
                          },
                          buttonColor: primaryWhite,
                          gradient: Paint()..shader = linearGradientText,
                        ),
                      ),
                    ],
                  ),
                ),
                customHeight(50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Do have an Account?",
                      style: AppTextStyle.normalBold14
                          .copyWith(color: appBackgroundColor),
                    ),
                    width05,
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Text(
                        "Login",
                        style: AppTextStyle.normalBold14.copyWith(
                          foreground: Paint()..shader = linearGradientText,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
