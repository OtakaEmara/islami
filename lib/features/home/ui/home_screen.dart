import 'package:flutter/material.dart';
import 'package:islami/features/home/ui/widgets/hadeth/ui/hadeth_screen.dart';
import 'package:islami/features/home/ui/widgets/quran/ui/quran_screen.dart';
import 'package:islami/features/home/ui/widgets/radio/ui/radio_screen.dart';
import 'package:islami/features/home/ui/widgets/sebha/ui/sebha_screen.dart';
import 'package:islami/features/home/ui/widgets/time/ui/time_screen.dart';

import '../../../utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0;

  List<Widget> pages = [
    const QuranScreen(),
    const HadethScreen(),
    const SebhaScreen(),
    const RadioScreen(),
    const TimeScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    BottomNavigationBarItem bottomNavDesign({required String imageName, required int index}){
      return BottomNavigationBarItem(
          icon: currentIndex == index
              ? Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04,vertical: height * 0.006),
              decoration: BoxDecoration(
                color: AppColors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(height * 0.07),
              ),
              child: ImageIcon(AssetImage('assets/images/$imageName.png'))
          )
              : ImageIcon(AssetImage('assets/images/$imageName.png')),
          label: ''
      );
    }

    return Scaffold(
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: AppColors.gold,
          ),
          child: BottomNavigationBar(
            selectedItemColor: AppColors.white,
            unselectedItemColor: AppColors.black,
            currentIndex: currentIndex,
            onTap: (index){
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              bottomNavDesign(
                  imageName: 'quran_tab',
                  index: 0
              ),
              bottomNavDesign(
                  imageName: 'hadeth_tab',
                  index: 1
              ),
              bottomNavDesign(
                  imageName: 'sebha_tab',
                  index: 2
              ),
              bottomNavDesign(
                  imageName: 'radio_tab',
                  index: 3
              ),
              bottomNavDesign(
                  imageName: 'time_tab',
                  index: 4
              ),
            ],
          ),
        ),
        body: pages[currentIndex]
    );
  }
}