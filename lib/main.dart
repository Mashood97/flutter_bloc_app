import 'package:beamer/beamer.dart';
import 'package:bloc_article_app/routing/beamer_routing_delegate.dart';
import 'package:bloc_article_app/src/headlines/cubit/toggle_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'chopper_client/chopper_client.dart';
import 'src/headlines/cubit/headline_cubit.dart';
import 'src/headlines/repository/post_repo_impl.dart';

void main() {
  ChopperClientInstance.initializeChopperClient();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final beamerRouterDelegate = BeamerRoutingDelegate();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              HeadlineCubit(HeadlineRepositoryImplementation()),
        ),
        BlocProvider(
          create: (context) => ToggleCubit(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Bloc/Cubit Apps',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.white,
            appBarTheme: AppBarTheme(
              color: Colors.white,
              elevation: 0,
              centerTitle: true,
              iconTheme: const IconThemeData(
                color: Colors.black,
              ),
              titleTextStyle:
                  GoogleFonts.aBeeZee(color: Colors.black, fontSize: 24),
            ),
            scaffoldBackgroundColor: Colors.white,
            textTheme: GoogleFonts.montserratTextTheme(),
            switchTheme: SwitchThemeData(
              trackColor: MaterialStateProperty.all(Colors.white),
              thumbColor: MaterialStateProperty.all(Colors.amber),
            )),
        routeInformationParser: BeamerParser(),
        routerDelegate: beamerRouterDelegate.routerDelegate,
        // home: const PostScreen(),
      ),
    );
  }
}
