import 'package:advanced_flutter_arabic/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NotifactionsPage extends StatefulWidget {
  const NotifactionsPage({Key? key}) : super(key: key);

  @override
  _NotifactionsPageState createState() => _NotifactionsPageState();
}

class _NotifactionsPageState extends State<NotifactionsPage> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(AppStrings.notifications.tr()),
    );
  }
}
