import 'package:BodyPower/features/user/data/controllers/signup_controller.dart';
import 'package:BodyPower/features/user/presentation/widgets/back_leading_card.dart';
import 'package:BodyPower/internal/helpers/color_helper.dart';
import 'package:BodyPower/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'edit_profile_screen.dart';
import 'muscle_progress_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Scaffold(
      appBar: AppBar(
        leading: const BackLeadingCard(),
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          "assets/images/BODYPOWER.png",
          width: 136.w,
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: ColorHelper.backgroundColor,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(30.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Nick name",
                  style: TextHelper.w700s16
                      .copyWith(color: ColorHelper.whiteECECEC),
                ),
                Text(
                  controller.nickName.text,
                  style: TextHelper.w700s18
                      .copyWith(color: ColorHelper.whiteECECEC),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                Text(
                  "Email",
                  style: TextHelper.w700s16
                      .copyWith(color: ColorHelper.whiteECECEC),
                ),
                Text(
                  controller.email.text,
                  style: TextHelper.w700s18
                      .copyWith(color: ColorHelper.whiteECECEC),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                Text(
                  "Phone number",
                  style: TextHelper.w700s16
                      .copyWith(color: ColorHelper.whiteECECEC),
                ),
                Text(
                  controller.phoneNumber.text,
                  style: TextHelper.w700s18
                      .copyWith(color: ColorHelper.whiteECECEC),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                Text(
                  "training days",
                  style: TextHelper.w700s16
                      .copyWith(color: ColorHelper.whiteECECEC),
                ),
                Spacer(),
                Text(
                  "1,2,3",
                  style: TextHelper.w700s18
                      .copyWith(color: ColorHelper.whiteECECEC),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                Text(
                  "time of trainging",
                  style: TextHelper.w700s16
                      .copyWith(color: ColorHelper.whiteECECEC),
                ),
                Spacer(),
                Text(
                  "22:00",
                  style: TextHelper.w700s18
                      .copyWith(color: ColorHelper.whiteECECEC),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h),
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const MuscleProgressScreen()));
                  },
                  child: Container(
                    width: 0.8.sw,
                    height: 50.h,
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
                      'Прогресс мышечной массы',
                      style: TextHelper.w700s20
                          .copyWith(color: ColorHelper.greyD1D3D3),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditProfileScreen()));
                },
                child: Container(
                  width: 0.8.sw,
                  height: 50.h,
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
                    'Изменить',
                    style: TextHelper.w700s20
                        .copyWith(color: ColorHelper.greyD1D3D3),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorHelper.greyD1D3D3,
                  ),
                  onPressed: () {
                    SignUpController.instance.logOut();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: ColorHelper.blue01DDEB,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "Log Out",
                        style: TextHelper.w700s20
                            .copyWith(color: ColorHelper.blue01DDEB),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}