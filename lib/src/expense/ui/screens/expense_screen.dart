import 'package:beamer/beamer.dart';
import 'package:bloc_article_app/constant/responsive/responsive.dart';
import 'package:flutter/material.dart';

import '../../../../constant/ui_constant.dart';

class ExpenseScreen extends StatefulWidget {
  final ColorSwatch colorSwatch;
  const ExpenseScreen({
    super.key,
    required this.colorSwatch,
  });

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: getResponsiveValue(context, 15),
            horizontal: getResponsiveValue(context, 25),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getResponsiveValue(context, 15),
              ),
              ListTile(
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.filter_list,
                    color: widget.colorSwatch["subHeadingColor"],
                  ),
                ),
                title: Text(
                  "My Personal Expenses",
                  style: TextStyle(
                    fontSize: getResponsiveValue(
                      context,
                      24,
                    ),
                    fontWeight: FontWeight.w700,
                    color: widget.colorSwatch["headingColor"],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (ctx) => Container(
              margin: EdgeInsets.all(
                getResponsiveValue(
                  context,
                  24,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    "Add Expense",
                    style: TextStyle(
                      fontSize: getResponsiveValue(
                        context,
                        20,
                      ),
                      fontWeight: FontWeight.w600,
                      color: widget.colorSwatch["headingColor"],
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextField(
                    // inputFormatters: [
                    //   AllowDigitsOnly(),
                    // ],
                    decoration: InputDecoration(
                      hintText: "Please enter item name",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: widget.colorSwatch["disabledBorder"]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: widget.colorSwatch["inputBorder"]!),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextField(
                    inputFormatters: [
                      AllowDigitsOnly(),
                    ],
                    decoration: InputDecoration(
                      hintText: "Please enter item price",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: widget.colorSwatch["disabledBorder"]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: widget.colorSwatch["inputBorder"]!),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "Quantity",
                      style: TextStyle(
                        fontSize: getResponsiveValue(
                          context,
                          18,
                        ),
                        fontWeight: FontWeight.w700,
                        color: widget.colorSwatch["subHeadingColor"],
                      ),
                    ),
                    trailing: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FloatingActionButton.small(
                          heroTag: "add_quantity",
                          onPressed: () {},
                          backgroundColor: widget.colorSwatch["inputBorder"],
                          child: const Icon(
                            Icons.add,
                            size: 16,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "0",
                            style: TextStyle(
                              fontSize: getResponsiveValue(
                                context,
                                18,
                              ),
                              fontWeight: FontWeight.w500,
                              color: widget.colorSwatch["subHeadingColor"],
                            ),
                          ),
                        ),
                        FloatingActionButton.small(
                          heroTag: "sub_quantity",
                          onPressed: () {},
                          backgroundColor: widget.colorSwatch["inputBorder"],
                          child: const Icon(
                            Icons.exposure_minus_1,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "Total Price",
                      style: TextStyle(
                        fontSize: getResponsiveValue(
                          context,
                          18,
                        ),
                        fontWeight: FontWeight.w700,
                        color: widget.colorSwatch["subHeadingColor"],
                      ),
                    ),
                    trailing: Text(
                      "\$0.0",
                      style: TextStyle(
                        fontSize: getResponsiveValue(
                          context,
                          20,
                        ),
                        fontWeight: FontWeight.w700,
                        color: widget.colorSwatch["headingColor"],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: getResponsiveValue(
                      context,
                      50,
                    ),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).clearSnackBars();

                          var snackBar = SnackBar(
                            content: Text(
                              "Your expense has been added",
                              style: TextStyle(
                                  color: widget.colorSwatch["headingColor"]),
                            ),
                            backgroundColor: widget.colorSwatch["successColor"],
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            widget.colorSwatch["btnColor"],
                          ),
                        ),
                        child: const Text(
                          "Submit",
                        )),
                  ),
                ],
              ),
            ),
          );
        },
        label: Text(
          "Add Expense",
          style: TextStyle(
            fontSize: getResponsiveValue(context, 14),
          ),
        ),
        icon: Icon(
          Icons.add,
          color: Colors.white,
          size: getResponsiveValue(context, 20),
        ),
        backgroundColor: widget.colorSwatch["btnColor"],
      ),
    );
  }
}
