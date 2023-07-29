import 'package:flutter/material.dart';

class DashboardItemModel {
  final String title;
  final Function onTap;
  final IconData trailingIcon;
  final Widget leadingIcon;
  DashboardItemModel({
    required this.title,
    required this.onTap,
    this.trailingIcon = Icons.arrow_forward,
    this.leadingIcon = const SizedBox.shrink(),
  });
}
