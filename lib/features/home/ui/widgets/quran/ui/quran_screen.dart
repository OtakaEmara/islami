import 'package:flutter/material.dart';
import 'package:islami/features/home/ui/widgets/quran/ui/widget/quran_details/widget/quran_arguments.dart';
import 'package:islami/utils/app_routes.dart';

import '../../../../../../utils/app_colors.dart';
import '../../../../../../utils/app_text_styles.dart';
import '../../../../logic/sura_list.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {

  List<String> filteredSuraArabicList= [];
  List<String> filteredSuraEnglishList= [];
  List<String> filteredSuraAyaList= [];
  List<int> filteredSuraIndexList= [];
  String text = '';

  void getSearch(){
    filteredSuraEnglishList = [];
    filteredSuraArabicList = [];
    filteredSuraAyaList = [];
    filteredSuraIndexList = [];
    for(int i = 0 ; i < 114 ; i++){
      if(text.isNotEmpty){
        if(SuraList.arabicQuranSuras[i].toString().toLowerCase().contains(text)){
          filteredSuraArabicList.add(SuraList.arabicQuranSuras[i]);
          filteredSuraEnglishList.add(SuraList.englishQuranSuras[i]);
          filteredSuraAyaList.add(SuraList.ayaNumber[i]);
          filteredSuraIndexList.add(i);
        }
        if(SuraList.englishQuranSuras[i].toString().toLowerCase().contains(text)){
          filteredSuraArabicList.add(SuraList.arabicQuranSuras[i]);
          filteredSuraEnglishList.add(SuraList.englishQuranSuras[i]);
          filteredSuraAyaList.add(SuraList.ayaNumber[i]);
          filteredSuraIndexList.add(i);
        }
      }else{
        filteredSuraArabicList = SuraList.arabicQuranSuras;
        filteredSuraEnglishList = SuraList.englishQuranSuras;
        filteredSuraAyaList = SuraList.ayaNumber;
        filteredSuraIndexList = List.generate(114, (index) => index);
      }
    }
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(List.generate(114, (index) => index));
    getSearch();
  }

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
                    onChanged: (value) {
                      text = value;
                      getSearch();
                      setState(() {

                      });
                    },
                    textAlign: TextAlign.start,
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
                  SizedBox(height: height * 0.03),
                  ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: filteredSuraAyaList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.quranDetails,
                              arguments: QuranArguments(
                                  index: filteredSuraIndexList[index],
                                  arabicSurahQuran: filteredSuraArabicList[index],
                                  englishSurahQuran: filteredSuraEnglishList[index]
                              ));
                        },
                        child: Row(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset("assets/images/img_sur_number_frame.png"),
                                Text("${filteredSuraIndexList[index] + 1}", style: AppTextStyles.font16BoldWhite,)
                              ],
                            ),
                            SizedBox(width: width * 0.05,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(filteredSuraEnglishList[index], style: AppTextStyles.font20BoldWhite,),
                                Text("${SuraList.ayaNumber[index]} Verses", style: AppTextStyles.font14BoldWhite,)
                              ],
                            ),
                            Spacer(),
                            Text(filteredSuraArabicList[index], style: AppTextStyles.font20BoldWhite,)
                          ],
                        ),
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
