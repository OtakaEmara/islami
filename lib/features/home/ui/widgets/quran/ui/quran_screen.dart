import 'package:flutter/material.dart';

import '../../../../../../utils/app_colors.dart';
import '../../../../../../utils/app_text_styles.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Image.asset("assets/images/quran_screen.png"),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Image.asset("assets/images/islami.png")),
                  TextField(
                    style: AppTextStyles.font16BoldLightWhite,
                    decoration: InputDecoration(
                      hintText: "Sura Name",
                      hintStyle: AppTextStyles.font16BoldLightWhite,
                      prefixIcon: ImageIcon(AssetImage("assets/images/quran_tab.png"),color: AppColors.gold),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: AppColors.gold,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: AppColors.gold,
                          width: 1.0,
                        ),
                      ),
                    )
                  ),
                  SizedBox(height: height * 0.02),
                  Text(
                    "Most Recently",
                    style: AppTextStyles.font16BoldLightWhite,
                  ),
                  SizedBox(height: height * 0.01),
                  SizedBox(
                    height: height * 0.15,
                    width: width,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                              vertical: height * 0.01,
                              horizontal: width * 0.03
                          ),
                          height: height * 0.15,
                          width: width * 0.7,
                          decoration: BoxDecoration(
                            color: AppColors.gold,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Al-Fatiha",
                                    style: AppTextStyles.font24BoldBlack,
                                  ),
                                  SizedBox(width: width * 0.02),
                                  Text(
                                    "الفاتحة",
                                    style: AppTextStyles.font24BoldBlack,
                                  ),
                                  Text(
                                    "7 Verses",
                                    style: AppTextStyles.font14BoldBlack,
                                  ),
                                ],
                              ),
                              Spacer(),
                              Image.asset("assets/images/img_most_recent.png")
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: width * 0.02);
                      },
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Text(
                    "Sura List",
                    style: AppTextStyles.font16BoldLightWhite,
                  ),
                  SizedBox(height: height * 0.01),
                  ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset("assets/images/img_sur_number_frame.png"),
                              Text("${index + 1}", style: AppTextStyles.font20BoldWhite,)
                            ],
                          ),
                          SizedBox(width: width * 0.05,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Al-Fatiha", style: AppTextStyles.font20BoldWhite,),
                              Text("7 Verses", style: AppTextStyles.font14BoldWhite,)
                            ],
                          ),
                          Spacer(),
                          Text("الفاتحه", style: AppTextStyles.font20BoldWhite,)
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: height * 0.015,
                            horizontal: width * 0.1
                        ),
                        child: Container(
                          height: 1,
                          width: width,
                          decoration: BoxDecoration(
                            color: AppColors.white
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: height * 0.02,
                  )
                ],
              ),
            ),
          ),
        )
      ]
    );
  }
}
