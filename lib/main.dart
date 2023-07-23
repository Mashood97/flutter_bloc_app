import 'package:bloc_article_app/src/headlines/cubit/toggle_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chopper_client/chopper_client.dart';
import 'src/headlines/cubit/headline_cubit.dart';
import 'src/headlines/repository/post_repo_impl.dart';
import 'src/headlines/ui/screen/headline_screen.dart';

void main() {
  ChopperClientInstance.initializeChopperClient();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      child: MaterialApp(
        title: 'ArticleApp',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.purple,
            switchTheme: SwitchThemeData(
              trackColor: MaterialStateProperty.all(Colors.white),
              thumbColor: MaterialStateProperty.all(Colors.amber),
            )),
        home: const PostScreen(),
      ),
    );
  }
}
