import 'package:beamer/beamer.dart';
import 'package:bloc_article_app/src/bmi/cubit/bmi_cubit.dart';
import 'package:bloc_article_app/src/dashboard/ui/screens/dashboard_screen.dart';
import 'package:bloc_article_app/src/expense/ui/screens/expense_screen.dart';
import 'package:bloc_article_app/src/headlines/ui/screen/headline_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../src/bmi/ui/screens/bmi_screen.dart';

class BeamerRoutingDelegate {
  static final BeamerRoutingDelegate _singleton =
      BeamerRoutingDelegate._internal();

  factory BeamerRoutingDelegate() {
    return _singleton;
  }

  BeamerRoutingDelegate._internal();

  final routerDelegate = BeamerDelegate(
    initialPath: AppRouteNames().initialRoute,
    setBrowserTabTitle: false,
    removeDuplicateHistory: true,
    locationBuilder: RoutesLocationBuilder(routes: {
      AppRouteNames().initialRoute: (context, BeamState state, data) =>
          const DashboardBaseScreen(),
      AppRouteNames().headlineRoute: (context, BeamState state, data) =>
          BeamPage(
            key: ValueKey(state.uri),
            child: const PostScreen(),
            type: BeamPageType.slideTopTransition,
          ),
      AppRouteNames().bmiCalculatorAppRoute: (context, BeamState state, data) {
        final colorSwatch = data as ColorSwatch;

        return BeamPage(
          key: ValueKey(state.uri),
          child: BlocProvider(
            create: (_) => BmiCubit(),
            child: BmiScreen(
              colorSwatch: colorSwatch,
            ),
          ),
          type: BeamPageType.slideTransition,
        );
      },
      AppRouteNames().expenseAppRoute: (context, state, data) {
        final colorSwatch = data as ColorSwatch;
        return BeamPage(
          key: ValueKey(state.uri),
          child: BlocProvider(
            create: (_) => BmiCubit(),
            child: ExpenseScreen(
              colorSwatch: colorSwatch,
            ),
          ),
          type: BeamPageType.fadeTransition,
        );
      },
    }
        // '/': (context, state, data) => HomeScreen(),
        // '/books': (context, state, data) => BooksScreen(),
        // '/books/:bookId': (context, state, data) {
        //   // Take the path parameter of interest from BeamState
        //   final bookId = state.pathParameters['bookId']!;
        //   // Collect arbitrary data that persists throughout navigation
        //   final info = (data as MyObject).info;
        //   // Use BeamPage to define custom behavior
        //   return BeamPage(
        //     key: ValueKey('book-$bookId'),
        //     title: 'A Book #$bookId',
        //     popToNamed: '/',
        //     type: BeamPageType.scaleTransition,
        //     child: BookDetailsScreen(bookId, info),
        //   );
        // }
        ),
  );
}

class AppRouteNames {
  static final AppRouteNames _singleton = AppRouteNames._internal();

  factory AppRouteNames() {
    return _singleton;
  }

  AppRouteNames._internal();
  String initialRoute = "/dashboard";
  String headlineRoute = "/headlines";
  String bmiCalculatorAppRoute = "/bmi-App";
  String expenseAppRoute = "/expense-App";
}
