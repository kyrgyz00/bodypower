import 'package:BodyPower/bottom_navigation_bar.dart';
import 'package:BodyPower/features/user/presentation/widgets/back_leading_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helper.dart';
import '../../data/controllers/signup_controller.dart';
import '../widgets/login_helper_cards.dart';
import '../widgets/password_signup_textfield_card.dart';
import '../widgets/signup_textfield_card.dart';
import 'forget_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const BackLeadingCard(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Вход"),
      ),
      backgroundColor: ColorHelper.backgroundColor,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 40.h,
          horizontal: 20.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Войдите в систему с одним из следующих вариантов",
                style:
                    TextHelper.w700s15.copyWith(color: ColorHelper.greyD1D3D3),
              ),
              SizedBox(
                height: 15.h,
              ),
              const LoginHelperCards(),
              Padding(
                padding: EdgeInsets.only(top: 40.h, bottom: 15.h),
                child: Text(
                  'Email',
                  style: TextHelper.w700s20
                      .copyWith(color: ColorHelper.greyD1D3D3),
                ),
              ),
              SignUpTextFieldCard(
                controller: controller.email,
                error: 'е имя'.toLowerCase(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h, bottom: 15.h),
                child: Text(
                  'Пароль',
                  style: TextHelper.w700s20
                      .copyWith(color: ColorHelper.greyD1D3D3),
                ),
              ),
              PasswordSignUpTextFieldCard(
                controller: controller.password,
              ),
              SizedBox(
                height: 60.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.to(() => ForgetPasswordScreen());
                    },
                    child: const Text("Забыли пароль?"),
                  )
                ],
              ),
              InkWell(
                onTap: () async {
                  // Get.replace(() => BottomNavBar());
                  SignUpController.instance.loginUser(
                      controller.email.text.trim(),
                      controller.password.text.trim());
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BottomNavBar()));
                },
                child: Container(
                  width: 1.sw,
                  height: 60.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Colors.purple.shade900, blurRadius: 6)
                    ],
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [
                        ColorHelper.blue01DDEB,
                        Colors.blue,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Text(
                    'Вход',
                    style: TextHelper.w700s20
                        .copyWith(color: ColorHelper.greyD1D3D3),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}