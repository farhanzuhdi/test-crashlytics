import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:test_crashlytics/core/utils/function.dart';
import 'package:test_crashlytics/module/dashboard/dashboard_screen.dart';

class LoginState with ChangeNotifier {
  final BuildContext context;
  TextEditingController textEditingController = TextEditingController();

  LoginState({required this.context}) {
    function.printResponse("login", "halaman login");
    initialLog();
  }

  initialLog() async {
    await FirebaseAnalytics.instance
        .logEvent(name: "login_page", parameters: {"result": "success"});
  }

  nextPage(BuildContext context) async {
    await FirebaseAnalytics.instance
        .logEvent(name: "click_login_button", parameters: {"result": "click"});
    if (textEditingController.text == "login") {
      await FirebaseAnalytics.instance.logEvent(
          name: "click_login_button", parameters: {"result": "success"});
      if (!context.mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const DashboardScreen(
                  title: 'List Films',
                )),
      );
    } else {
      await FirebaseAnalytics.instance.logEvent(
          name: "click_login_button", parameters: {"result": "failure"});
    }
  }
}
