import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/Utilities/constants/colors.dart';
import 'package:my_first_flutter_app/Utilities/constants/image_strings.dart';
import 'package:my_first_flutter_app/Utilities/device/device_utilities.dart';
import 'package:my_first_flutter_app/Utilities/helpers/helpers.dart';
import 'package:my_first_flutter_app/Utilities/constants/lang_english.dart';
import 'package:my_first_flutter_app/Utilities/constants/sizes.dart';
import 'package:my_first_flutter_app/features/Onboarding/onboarding_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = Get.put(OnboardingController());
  @override
  Widget build(BuildContext context) {
    final dark = Helper.isDarkMode(context);
    return Scaffold(
      body: Stack(

        children: <Widget>[
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: <Widget>[
              OnboardingPage(title: English.onBoardingTitle1, description: English.onBoardingDesc1, image: AppImages.onBoarding1,),
              OnboardingPage(title: English.onBoardingTitle2, description: English.onBoardingDesc2, image: AppImages.onBoarding2,),
              OnboardingPage(title: English.onBoardingTitle3, description: English.onBoardingDesc3, image: AppImages.onBoarding3,)
            ],
          ),
          Positioned(top: DeviceUtils.getAppBarHeight(), right: AppSizes.defaultSpace, child: onBoardingSkipBtn(title: 'Skip', dark: dark,)),
          Positioned(bottom: DeviceUtils.getBottomNavigationBarHeight(), right: AppSizes.defaultSpace, child: onboardingNextButton(dark: dark)),
          Positioned(bottom: DeviceUtils.getBottomNavigationBarHeight(), left: AppSizes.defaultSpace, child: onboardingPageIndicator(dark: dark))
        ],

      ),
    );
  }
}

class onBoardingSkipBtn extends StatelessWidget {
   onBoardingSkipBtn({
    super.key,
     required this.title,
     required this.dark,
  });

  final String title;
  final bool dark;
  final controller = OnboardingController.instance;
  @override
  Widget build(BuildContext context) {



    return TextButton(onPressed: (){
      controller.skipPage();
    }, child:  Text(title));
  }
}

class onboardingNextButton extends StatelessWidget {
   onboardingNextButton({
    super.key,
    required this.dark,
  });
  final  controller = OnboardingController.instance;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: dark ? AppColors.primary : AppColors.dark, shape: CircleBorder()), onPressed: () {
      controller.nextPage();
    }, child: Icon(Icons.arrow_right));
  }
}

class onboardingPageIndicator extends StatelessWidget {
   onboardingPageIndicator({
    super.key,
    required this.dark,
  });
  final controller = OnboardingController.instance;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(onDotClicked: controller.onPageControllerTapped, controller: controller.pageController, count: 3, effect: ExpandingDotsEffect(activeDotColor: dark ? AppColors.white : AppColors.dark  , dotHeight: 6));
  }
}

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key, required this.title, required this.description, required this.image,
  });

  final String title, description, image;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(AppSizes.defaultSpace),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: Helper.screenWidth() * 0.8,
              width: Helper.screenHeight() * 0.6,
              child: Image(width: Helper.screenWidth() * 0.8,
                height: Helper.screenHeight() * 0.6,
                image: AssetImage(image),
              ),
            ),
            SizedBox(height: AppSizes.defaultSpace),

            Text(title,
              textAlign: TextAlign.center,
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineMedium,
            ),
            SizedBox(height: AppSizes.defaultSpace),
            Text(description,
    textAlign: TextAlign.center,
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium,
            ),
          ]),
    );
  }
}




