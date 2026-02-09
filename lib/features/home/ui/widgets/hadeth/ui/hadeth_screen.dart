import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_text_styles.dart';

class HadethScreen extends StatefulWidget {
  const HadethScreen({super.key});

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {

  List<String> title = [];
  List<String> content = [];

  void getHadeth()async{
    String file = '';
    for(int i = 0 ; i < 50 ; i++){
      file = await rootBundle.loadString("assets/files/hadeeth/h${i + 1}.txt");
      title.add(file.substring(0,file.indexOf('\n')));
      content.add(file.substring(file.indexOf('\n')));
    }
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHadeth();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
        children: [
          Image.asset("assets/images/hadeth_screen.png"),
          SafeArea(
              child: Column(
                children: [
                  Center(child: Image.asset("assets/images/islami.png")),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: title.isNotEmpty && content.isNotEmpty ?
                      CarouselSlider(
                          items: List.generate(50, (index) => index,).map((index){
                            return Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Image.asset("assets/images/hadith_card.png"),
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: height * 0.06),
                                      child: Text(title[index],style: AppTextStyles.font20BoldBlack,),
                                    ),
                                    SizedBox(height: height * 0.01,),
                                    Expanded(
                                      child: Padding(
                                        padding:  EdgeInsets.symmetric(horizontal: width * 0.05),
                                        child: SingleChildScrollView(child: Text(content[index],style: AppTextStyles.font16BoldBlack,textAlign: TextAlign.center,)),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          }).toList(),
                        options: CarouselOptions(
                          height: height * 0.66,
                          padEnds: false,
                          autoPlayCurve: Curves.bounceInOut,
                          enlargeCenterPage: true,
                        ),
                      ) : Center(child: CircularProgressIndicator(color: AppColors.gold,)),
                    ),
                  )
                ],
              )
          )
        ]
    );
  }
}
