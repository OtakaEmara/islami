import 'package:flutter/material.dart';
import 'package:islami/utils/shared_preference.dart';

import '../../../../../../utils/app_colors.dart';
import '../../../../../../utils/app_text_styles.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  String text = 'سبحان الله';
  int subhanCounter = 0;
  int hamdCounter = 0;
  int akbarCounter = 0;
  bool isSubhan = true;
  bool isHamd = false;
  bool isAkbar = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subhanCounter = SharedPref.getInt("subhanCounter") ?? 0;
    hamdCounter = SharedPref.getInt("hamdCounter") ?? 0;
    akbarCounter = SharedPref.getInt("akbarCounter") ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Widget sebhaDesign({required String text, required Function() onTap}) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05,vertical: height * 0.005),
            decoration: BoxDecoration(
              color: AppColors.gold,
              borderRadius: BorderRadius.circular(height * 0.01),
            ),
          child: Text(text , style: AppTextStyles.font20BoldWhite,),
        ),
      );
    }

    return Stack(
      children: [
        Image.asset("assets/images/sebha_screen.png"),
        SafeArea(
          child: Expanded(
            child: Column(
              children: [
                Center(child: Image.asset("assets/images/islami.png")),
                SizedBox(height: height * 0.001,),
                Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى ",style: AppTextStyles.font36BoldWhite,),
                SizedBox(height: height * 0.01,),
                GestureDetector(
                  onTap: (){
                    if(isSubhan){
                      subhanCounter++;
                      SharedPref.saveInt("subhanCounter", subhanCounter);
                    }
                    if(isHamd){
                      hamdCounter++;
                      SharedPref.saveInt("hamdCounter", hamdCounter);
                    }
                    if(isAkbar){
                      akbarCounter++;
                      SharedPref.saveInt("akbarCounter", akbarCounter);
                    }
                    setState(() {

                    });
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset("assets/images/sebha_shape.png"),
                      Column(
                        children: [
                          SizedBox(height: height * 0.1,),
                          Text(text,style: AppTextStyles.font36BoldWhite,),
                          SizedBox(height: height * 0.01,),
                          if(isSubhan)
                            Column(
                              children: [
                                Text("$subhanCounter",style: AppTextStyles.font36BoldWhite,),
                                SizedBox(height: height * 0.02,),
                                if(subhanCounter != 0)
                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        subhanCounter = 0;
                                      });
                                    },
                                    child: Text('Reset' , style: AppTextStyles.font20BoldWhite.copyWith(color: Colors.red),)
                                )
                              ],
                            ),
                          if(isHamd)
                            Column(
                              children: [
                                Text("$hamdCounter",style: AppTextStyles.font36BoldWhite,),
                                SizedBox(height: height * 0.02),
                                if(hamdCounter != 0)
                                  GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          hamdCounter = 0;
                                        });
                                      },
                                      child: Text('Reset', style: AppTextStyles.font20BoldWhite.copyWith(color: Colors.red),)
                                  )
                              ],
                            ),
                          if(isAkbar)
                            Column(
                              children: [
                                Text("$akbarCounter",style: AppTextStyles.font36BoldWhite,),
                                SizedBox(height: height * 0.02),
                                if(akbarCounter != 0)
                                  GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          akbarCounter = 0;
                                        });
                                      },
                                      child: Text('Reset' , style: AppTextStyles.font20BoldWhite.copyWith(color: Colors.red),)
                                  )
                              ],
                            ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: height * 0.03,),
                Padding(
                  padding: EdgeInsets.all(height * 0.001),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      sebhaDesign(
                        text: 'الله أَكْبَرُ',
                        onTap: (){
                          setState(() {
                            text = 'الله أَكْبَرُ';
                            isSubhan = false;
                            isHamd = false;
                            isAkbar = true;
                          });
                        },
                      ),
                      sebhaDesign(
                        text: 'الحمد للهُ',
                        onTap: (){
                          text = 'الحمد للهُ';
                          isSubhan = false;
                          isHamd = true;
                          isAkbar = false;
                          setState(() {
            
                          });
                        },
                      ),
                      sebhaDesign(
                        text: 'سبحان الله',
                        onTap: (){
                          text = 'سبحان الله';
                          isSubhan = true;
                          isHamd = false;
                          isAkbar = false;
                          setState(() {
            
                          });
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
