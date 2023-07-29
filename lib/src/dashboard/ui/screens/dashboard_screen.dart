import 'package:beamer/beamer.dart';
import 'package:bloc_article_app/constant/ui_constant.dart';
import 'package:bloc_article_app/routing/beamer_routing_delegate.dart';
import 'package:bloc_article_app/src/dashboard/model/dashboard_item.dart';
import 'package:flutter/material.dart';

import '../../../../constant/responsive/responsive.dart';

class DashboardBaseScreen extends StatefulWidget {
  const DashboardBaseScreen({super.key});

  @override
  State<DashboardBaseScreen> createState() => _DashboardBaseScreenState();
}

class _DashboardBaseScreenState extends State<DashboardBaseScreen> {
  final List<DashboardItemModel> _items = [];

  @override
  void initState() {
    _items.addAll(
      [
        DashboardItemModel(
          title: "News App",
          leadingIcon: const Icon(
            Icons.newspaper,
          ),
          onTap: () {
            context.beamToNamed(
              AppRouteNames().headlineRoute,
            );
          },
        ),
        DashboardItemModel(
          title: "BMI Calculator App",
          leadingIcon: const Icon(
            Icons.calculate_rounded,
          ),
          onTap: () {
            context.beamToNamed(
              AppRouteNames().bmiCalculatorAppRoute,
              data: AppColors().bmiColorSwatch,
            );
          },
        ),
        DashboardItemModel(
          title: "Expense App",
          leadingIcon: const Icon(
            Icons.money,
          ),
          onTap: () {
            // context.beamToNamed(
            //   AppRouteNames().headlineRoute,
            // );
          },
        ),
        DashboardItemModel(
          title: "Meals App",
          leadingIcon: const Icon(
            Icons.food_bank,
          ),
          onTap: () {
            // context.beamToNamed(
            //   AppRouteNames().headlineRoute,
            // );
          },
        ),
        DashboardItemModel(
          title: "Booking App",
          leadingIcon: const Icon(
            Icons.book_online,
          ),
          onTap: () {
            // context.beamToNamed(
            //   AppRouteNames().headlineRoute,
            // );
          },
        ),
      ],
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Bloc/Cubit Apps",
        ),
      ),
      body: SafeArea(
        child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (ctx, index) => ListTile(
            onTap: () => _items[index].onTap.call(),
            trailing: Icon(
              _items[index].trailingIcon,
            ),
            leading: _items[index].leadingIcon,
            title: Text(
              _items[index].title,
              style: TextStyle(
                fontSize: getResponsiveValue(context, 18),
                color: Colors.black87,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            ),
          ),
          itemCount: _items.length,
        ),
      ),
    );
  }
}
