import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController{
  static OnBoardingController get instance => Get.find();

  //Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;
  
  //Update Current Index when page scroll
  void UpdatePageIndicator(index) => currentPageIndex.value = index;

  //jump to specific page when skip button is clicked
  void dotNavigationClick(index){
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }



  //Update Current Index & jump to next page
  void NextPage(){
    if(currentPageIndex.value == 2){
      // Get.offAllNamed('');
    }else{
      currentPageIndex.value = currentPageIndex.value + 1;
      pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }

  }

  void skipPage(){
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);


  }

}