import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:t_store/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/device/device_utility.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../widgets/onboardingscreen.dart';
import '../widgets/onboardingskip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
        body: Stack(
          children: [
            //Horizantal scrollable pages
            PageView
            ( controller : controller.pageController,
            onPageChanged: controller.UpdatePageIndicator,
              children:  const [
                  OnboardingScreen(
                    image: TImages.onBoardingImage1,
                    title: TTexts.onBoardingTitle1,
                    subTitle: TTexts.onBoardingSubTitle1,
                  ),
                  OnboardingScreen(
                    image: TImages.onBoardingImage2,
                    title: TTexts.onBoardingTitle2,
                    subTitle: TTexts.onBoardingSubTitle2,
                  ),
                  OnboardingScreen(
                    image: TImages.onBoardingImage3,
                    title: TTexts.onBoardingTitle3,
                    subTitle: TTexts.onBoardingSubTitle3,
                  ),
                    ],
                  ),
                  //Skip button
                  OnBoardingSkip(),
                  //Smooth Page Indicator Page
                  Positioned(
                    bottom: TDeviceUtils.getBottomNavigationBarHeight() +25,
                    left: TSizes.defaultSpace,
                    
                    child: SmoothPageIndicator(
                      controller: controller.pageController,
                      count: 3,
                      onDotClicked: controller.dotNavigationClick,
                      effect: ExpandingDotsEffect(
                        activeDotColor: dark ? TColors.textWhite : TColors.black, dotHeight: 6
                        ),),),
                    OnboardingNextButton(),
          ],
              ));
   
  }
}

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
     final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      right: TSizes.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.NextPage(),
        child: const Icon(Icons.arrow_forward_ios),
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(), backgroundColor: dark ? TColors.textWhite : TColors.black,),
      ),
    
    );
  }
}



