import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:test_crashlytics/core/data/models/film_model.dart';
import 'package:test_crashlytics/core/data/services/film_service.dart';
import 'package:test_crashlytics/core/utils/function.dart';

class DashboardState with ChangeNotifier {
  final BuildContext context;
  ResultFilm? resultFilm;

  DashboardState({required this.context}) {
    function.printResponse("dashboard", "halaman dashboard");
    initialLog();
    getListFilm();
  }

  initialLog() async {
    await FirebaseAnalytics.instance
        .logEvent(name: "dashboard_page", parameters: {"result": "success"});
  }

  getListFilm() async {
    resultFilm = await filmService.getListFilms();
    notifyListeners();
    if (resultFilm!.status!) {
      await FirebaseAnalytics.instance.logEvent(
          name: "dashboard_page_get_film", parameters: {"result": "success"});
    } else {
      await FirebaseAnalytics.instance.logEvent(
          name: "dashboard_page_get_film", parameters: {"result": "failure"});
      function.printResponse("errorListFilm", resultFilm!.message!);
    }
  }
}
