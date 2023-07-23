import 'package:bloc_article_app/src/headlines/cubit/toggle_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/loader.dart';
import '../../cubit/headline_cubit.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void didChangeDependencies() {
    BlocProvider.of<HeadlineCubit>(context).getTopHeadlines();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Headlines",
        ),
        actions: [
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(
          //     Icons.switch_account,
          //   ),
          // ),
          BlocBuilder<ToggleCubit, ToggleState>(
            builder: (context, state) {
              return Switch.adaptive(
                value: state == ToggleState.on,
                onChanged: (_) => context.read<ToggleCubit>().toggle(),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocConsumer<HeadlineCubit, HeadlineState>(
            builder: (context, state) {
              if (state is HeadlineInitial) {
                return const Center(
                  child: Text("No Headlines Found"),
                );
              } else if (state is HeadlineLoading) {
                return const AppLoader();
              } else if (state is HeadlineLoaded) {
                //show list view
                return ListView.separated(
                  separatorBuilder: (_, __) => const Divider(
                    color: Colors.black45,
                  ),
                  itemBuilder: (ctx, index) => ListTile(
                    title: Text(
                      state.headline[index].headlineTitle ?? "Title",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        state.headline[index].headlineDescription ?? "Title",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                          fontWeight: FontWeight.w400,
                          wordSpacing: 1.5,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                  itemCount: state.headline.length,
                );
              } else {
                return const Center(
                  child: Text("No Headlines Found"),
                );
              }
            },
            listener: (context, state) {
              //Show Errors.
              if (state is HeadlineError) {
                var snackBar = SnackBar(
                  content: Text(state.message),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
          ),
        ),
      ),
    );
  }
}
