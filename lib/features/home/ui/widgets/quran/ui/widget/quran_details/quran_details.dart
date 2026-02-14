import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/features/home/ui/widgets/quran/ui/widget/quran_details/widget/quran_arguments.dart';
import 'package:islami/utils/app_text_styles.dart';

import '../../../../../../../../utils/app_colors.dart';

class QuranDetails extends StatefulWidget {
  const QuranDetails({super.key});

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {

  List<String> surahDetails = [];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;


    QuranArguments quranArguments = ModalRoute.of(context)!.settings.arguments as QuranArguments;

    void getSurahDetails() async {
      String file = await rootBundle.loadString('assets/files/surahs/${quranArguments.index + 1}.txt');
      List<String> surah = file.split('\n');
      surahDetails = surah;
      setState(() {

      });
    }

    if(surahDetails.isEmpty){
      getSurahDetails();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(quranArguments.englishSurahQuran,style: AppTextStyles.font20BoldGold,),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset('assets/images/soura_details_screen.png'),
          Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(height * 0.03),
                  child: Text(quranArguments.arabicSurahQuran,style: AppTextStyles.font24BoldGold,),
                ),
                SizedBox(height: height * 0.03,),
                Expanded(
                    child: ListView.separated(
                      itemCount: surahDetails.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            selectedIndex = index;
                            setState(() {

                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: height * 0.015 , horizontal: width * 0.05),
                              decoration: BoxDecoration(
                                color: selectedIndex == index ? AppColors.gold : AppColors.black,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: AppColors.gold)
                              ),
                              child: Row(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset("assets/images/img_sur_number_frame.png", color: selectedIndex == index ? AppColors.black : AppColors.gold, height: height * 0.06,),
                                      Text("${index + 1}", style: AppTextStyles.font15BoldWhite.copyWith(color: selectedIndex == index ? AppColors.black : AppColors.gold),)
                                    ],
                                  ),
                                  SizedBox(width: width * 0.005),
                                  Expanded(child: Text(surahDetails[index],style: AppTextStyles.font20BoldGold.copyWith(color: selectedIndex == index ? AppColors.black : AppColors.gold),textDirection: TextDirection.rtl))
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: height * 0.02,);
                      },
                    ),
                ),
                SizedBox(height: height * 0.01)
              ]),
        ],
      ),
    );
  }
}