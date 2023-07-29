import 'dart:developer';

import 'package:bloc_article_app/constant/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/loader.dart';
import '../../cubit/headline_cubit.dart';
import '../../cubit/toggle_cubit.dart';

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
          "NewsiFY",
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(
            getResponsiveValue(context, 50),
          ),
          child: TextField(
            cursorColor: Colors.black,
            cursorHeight: getResponsiveValue(
              context,
              20,
            ),
            onChanged: (val) async {
              if (val.isNotEmpty) {
                await context
                    .read<HeadlineCubit>()
                    .searchHeadlines(searchText: val);
              } else {
                await context.read<HeadlineCubit>().getTopHeadlines();
              }
            },
            onSubmitted: null,
            decoration: InputDecoration(
                filled: true,
                constraints: BoxConstraints(
                  maxWidth: getResponsiveValue(context, 600),
                  maxHeight: getResponsiveValue(context, 75),
                ),
                fillColor: Colors.white70,
                disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade50,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black54,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black54,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Search"),
          ),
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
                inactiveTrackColor: Colors.grey.shade300,
                inactiveThumbColor: Colors.grey,
                activeTrackColor: Colors.grey.shade300,
                activeColor: Colors.amber,
                onChanged: (_) => context.read<ToggleCubit>().toggle(),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(
            getResponsiveValue(context, 16),
          ),
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
                      style: TextStyle(
                        fontSize: getResponsiveValue(context, 18),
                        color: Colors.black87,
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        state.headline[index].headlineDescription ?? "Title",
                        style: TextStyle(
                          fontSize: getResponsiveValue(context, 14),
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
                ScaffoldMessenger.of(context).clearSnackBars();

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
