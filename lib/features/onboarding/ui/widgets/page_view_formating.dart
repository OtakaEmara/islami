import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_routes.dart';
import '../../../../utils/app_text_styles.dart';

class PageViewFormating extends StatelessWidget {
  const PageViewFormating({super.key});


  @override
  Widget build(BuildContext context) {

    PageController pageController = PageController();

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Widget pageViewContent({required String imageName, required String title, String? subtitle}){
      return Column(
        children: [
          Image.asset("assets/images/islami.png"),
          SizedBox(height: height * 0.05),
          Image.asset("assets/images/$imageName.png"),
          if(subtitle != null)
            SizedBox(height: height * 0.02),
          if(subtitle == null)
            SizedBox(height: height * 0.05),
          Text(title,style: AppTextStyles.font24BoldGold),
          if(subtitle != null)
            SizedBox(height: height * 0.02),
          if(subtitle != null)
            Text(subtitle,style: AppTextStyles.font20BoldGold,textAlign: TextAlign.center,),
        ],
      );
    }

    List<Widget> pages = [
      pageViewContent(imageName: "welcome", title: "Welcome To Islmi App"),
      pageViewContent(imageName: "mosque", title: "Welcome To Islami", subtitle: "We Are Very Excited To Have You In Our Community"),
      pageViewContent(imageName: "quran", title: "Reading the Quran", subtitle: 'Read, and your Lord is the Most Generous'),
      pageViewContent(imageName: "bearish", title: "Bearish",subtitle: "Praise the name of your Lord, the Most High"),
      pageViewContent(imageName: "radio", title: "Holy Quran Radio", subtitle: 'You can listen to the Holy Quran Radio through the application for free and easily'),
    ];

    return PageView.builder(
        itemCount: pages.length,
        controller: pageController,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: Column(
                children: [
                  Expanded(child: pages[index]),
                  Row(
                    children: [
                      if(index != 0)
                        TextButton(
                            onPressed: (){
                              pageController.animateToPage(
                                  index - 1,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut
                              );
                            },
                            child: Text("Back",style: AppTextStyles.font16BoldGold,)
                        ),
                      Spacer(),
                      SmoothPageIndicator(
                        key: PageStorageKey('pageView'),
                        count: pages.length,
                        effect: ExpandingDotsEffect(
                          activeDotColor: AppColors.gold,
                          dotColor: AppColors.grey,
                          dotHeight: height * 0.007,
                          dotWidth: width * 0.02,
                          spacing: width * 0.02,
                        ),
                        controller: pageController,
                        onDotClicked: (index) {
                          pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },

                      ),
                      Spacer(),
                      if(index != pages.length - 1)
                        TextButton(
                            onPressed: (){
                              pageController.animateToPage(
                                  index + 1,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut
                              );
                            },
                            child: Text("Next",style: AppTextStyles.font16BoldGold,)
                        ),
                      if(index == pages.length - 1)
                        TextButton(
                            onPressed: (){
                              Navigator.pushReplacementNamed(context, AppRoutes.home);
                            },
                            child: Text("Finish",style: AppTextStyles.font16BoldGold,)
                        )
                    ],
                  )
                ]
            ),
          );
        }
    );
  }
}
