import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/Utilities/constants/colors.dart';
import 'package:my_first_flutter_app/Utilities/constants/image_strings.dart';
import 'package:my_first_flutter_app/Utilities/device/device_utilities.dart';
import 'package:my_first_flutter_app/Utilities/helpers/helpers.dart';
import 'package:my_first_flutter_app/Utilities/constants/lang_english.dart';
import 'package:my_first_flutter_app/Utilities/constants/sizes.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    final dark = Helper.isDarkMode(context);
    return Scaffold(
      body: Padding(padding: EdgeInsets.only(top: DeviceUtils.getAppBarHeight(), bottom: DeviceUtils.getBottomNavigationBarHeight(), right: AppSizes.defaultSpace, left: AppSizes.defaultSpace
    ),
        child:
        Row(
          children: <Widget>[
            TextField(decoration: InputDecoration(
              prefixIcon: Icon(Icons.email),
              hintText: 'E - mail',
            )),
            SizedBox(height: AppSizes.spaceBtwSections),
            TextField(decoration: InputDecoration(
                prefixIcon: Icon(Icons.password),
                hintText: 'Password',
                suffixIcon: Icon(Icons.remove_red_eye)
            )),
            SizedBox(height: AppSizes.spaceBtwSections),
            SizedBox(
              height: DeviceUtils.getScreenHeight() / 15,
              width: DeviceUtils.getScreenWidth(context) - (AppSizes.defaultSpace * 2),
              child:  OutlinedButton(
                  onPressed: () {}, child: Text('Create Account')),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(child: Divider(
                  color: dark ? AppColors.white : AppColors.grey, thickness: 1.5, indent: 60, endIndent: 5,
                )),
                Text(style: Theme
                    .of(context)
                    .textTheme
                    .bodyMedium,  'Or sign in with'),
                Flexible(child: Divider(
                  color: dark ? AppColors.white : AppColors.grey, thickness: 1.5, indent: 5, endIndent: 60,
                ))

              ],
            ),

            SizedBox(height: AppSizes.spaceBtwSections),
            Align(alignment: Alignment.center,
              child: Container(

                height: 50,
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 50,
                      child: OutlinedButton( style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                      ), onPressed: (){}, child: Image(image: AssetImage(AppImages.googleLogo))),
                    ),
                    Container(height: AppSizes.spaceBtwItems),
                    Container(
                      height: 50,
                      width: 50,
                      child: OutlinedButton(style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                      ),onPressed: (){}, child: Image(image: AssetImage(AppImages.faceBookLogo),)),
                    ),
                  ],

                ),
              ),
            )
          ],
        ),
    ),
      );


  }
}
