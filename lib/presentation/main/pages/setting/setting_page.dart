import 'package:advanced_flutter_arabic/app/app_prefs.dart';
import 'package:advanced_flutter_arabic/app/di.dart';
import 'package:advanced_flutter_arabic/presentation/resources/assets_manager.dart';
import 'package:advanced_flutter_arabic/presentation/resources/routes_manager.dart';
import 'package:advanced_flutter_arabic/presentation/resources/strings_manager.dart';
import 'package:advanced_flutter_arabic/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final AppPrefrances _prefrances = instance<AppPrefrances>();
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView(
      padding: const EdgeInsets.all(AppPadding.p8),
      children: [
        ListTile(
          title: Text(
            AppStrings.changeLanguage.tr(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          trailing: SvgPicture.asset(ImageAssets.rightArrowSettingsIc),
          leading: SvgPicture.asset(ImageAssets.changeLangIc),
          onTap: () {
            _changeLang();
          },
        ),
        ListTile(
          title: Text(
            AppStrings.contactUs.tr(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          trailing: SvgPicture.asset(ImageAssets.rightArrowSettingsIc),
          leading: SvgPicture.asset(ImageAssets.contactUsIc),
          onTap: () {
            _contactUs();
          },
        ),
        ListTile(
          title: Text(
            AppStrings.inviteYourFriends.tr(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          trailing: SvgPicture.asset(ImageAssets.rightArrowSettingsIc),
          leading: SvgPicture.asset(ImageAssets.inviteFriendsIc),
          onTap: () {
            _inviteYourFriends();
          },
        ),
        ListTile(
          title: Text(
            AppStrings.logout.tr(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          trailing: SvgPicture.asset(ImageAssets.rightArrowSettingsIc),
          leading: SvgPicture.asset(ImageAssets.logoutIc),
          onTap: () {
            _logout();
          },
        )
      ],
    ));
  }

  _changeLang() {
    _prefrances.setAppLang();
    Phoenix.rebirth(context);
  }
  _contactUs() {}
  _inviteYourFriends() {}
  _logout() {
    _prefrances.logout();
    Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
  }
}
