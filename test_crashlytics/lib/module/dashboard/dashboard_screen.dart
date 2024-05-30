import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_crashlytics/module/dashboard/dashboard_state.dart';

class DashboardScreen extends StatelessWidget {
  final String title;
  const DashboardScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DashboardState>(
      create: (BuildContext context) => DashboardState(context: context),
      child: Consumer<DashboardState>(
        builder: (_, dashboardState, __) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text(title),
            ),
            body: Center(
              child: ListView(
                children: dashboardState.resultFilm == null
                    ? []
                    : List.generate(
                        dashboardState.resultFilm!.list!.length,
                        (index) => ListTile(
                            title: Text(dashboardState
                                .resultFilm!.list![index].title!))),
              ),
            ),
          );
        },
      ),
    );
  }
}
