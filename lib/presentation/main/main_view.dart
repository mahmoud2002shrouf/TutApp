import 'package:advanced_flutter_arabic/presentation/main/pages/home/view/home_page.dart';
import 'package:advanced_flutter_arabic/presentation/main/pages/notifications/notifactions_page.dart';
import 'package:advanced_flutter_arabic/presentation/main/pages/search/search_page.dart';
import 'package:advanced_flutter_arabic/presentation/main/pages/setting/setting_page.dart';
import 'package:advanced_flutter_arabic/presentation/resources/color_manager.dart';
import 'package:advanced_flutter_arabic/presentation/resources/strings_manager.dart';
import 'package:advanced_flutter_arabic/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final List<Widget> pages = [
    HomePage(),
    SearchPage(),
    NotifactionsPage(),
    SettingPage()
  ];
  final List<String> _title = [
    AppStrings.home.tr(),
    AppStrings.serch.tr(),
    AppStrings.notifications.tr(),
    AppStrings.setting.tr(),
  ];
  // String _title = AppStrings.home;
  int _currantIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _title[_currantIndex],
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      body: pages[_currantIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ColorManager.grey,
              spreadRadius: AppSize.s1,
            )
          ],
        ),
        child: BottomNavigationBar(
          items:  [
            BottomNavigationBarItem(
                icon:const Icon(Icons.home_outlined), label: AppStrings.home.tr()),
            BottomNavigationBarItem(
                icon:const Icon(Icons.search), label: AppStrings.serch.tr()),
            BottomNavigationBarItem(
                icon: const Icon(Icons.notifications),
                label: AppStrings.notifications.tr()),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings), label: AppStrings.setting.tr()),
          ],
          selectedItemColor: ColorManager.primary,
          unselectedItemColor: ColorManager.grey,
          currentIndex: _currantIndex,
          onTap: onTab,
        ),
      ),
    );
  }

  onTab(int index) {
    setState(() {
      _currantIndex = index;
    });
  }
}
