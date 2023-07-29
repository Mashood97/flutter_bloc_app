import 'package:bloc_article_app/constant/responsive/responsive.dart';
import 'package:bloc_article_app/src/bmi/cubit/bmi_cubit.dart';
import 'package:bloc_article_app/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constant/ui_constant.dart';

class BmiScreen extends StatefulWidget {
  final ColorSwatch colorSwatch;
  const BmiScreen({
    super.key,
    required this.colorSwatch,
  });

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  late ColorSwatch colorSwatch;
  @override
  void initState() {
    colorSwatch = widget.colorSwatch;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "BMI APP",
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getResponsiveValue(context, 24),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getResponsiveValue(context, 10),
              ),
              TextField(
                controller: _ageController,
                inputFormatters: [
                  AllowDigitsOnly(),
                ],
                decoration: InputDecoration(
                  hintText: "Please enter your age",
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: colorSwatch["disabledBorder"]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: colorSwatch["inputBorder"]!),
                  ),
                ),
              ),
              SizedBox(
                height: getResponsiveValue(context, 14),
              ),
              TextField(
                controller: _weightController,
                inputFormatters: [
                  AllowDigitsOnly(),
                ],
                decoration: InputDecoration(
                  hintText: "Please enter your weight in pounds(lb)",
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: colorSwatch["disabledBorder"]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: colorSwatch["inputBorder"]!),
                  ),
                ),
              ),
              SizedBox(
                height: getResponsiveValue(context, 14),
              ),
              TextField(
                controller: _heightController,
                inputFormatters: [
                  AllowDigitsOnly(),
                ],
                decoration: InputDecoration(
                  hintText: "Please enter your height in inches(in)",
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: colorSwatch["disabledBorder"]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: colorSwatch["inputBorder"]!),
                  ),
                ),
              ),
              SizedBox(
                height: getResponsiveValue(context, 15),
              ),
              BlocConsumer<BmiCubit, BmiState>(
                listener: (context, state) {
                  if (state is BmiErrorState) {
                    ScaffoldMessenger.of(context).clearSnackBars();

                    var snackBar = SnackBar(
                      content: Text(state.errorMsg),
                      backgroundColor: colorSwatch["successColor"],
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                builder: (context, state) {
                  if (state is BmiLoadingState) {
                    return const AppLoader();
                  } else if (state is BmiLoadedState) {
                    return RichText(
                      text: TextSpan(
                        text: "You're",
                        style: TextStyle(
                          fontSize: getResponsiveValue(
                            context,
                            16,
                          ),
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                        ),
                        children: [
                          TextSpan(
                            text: " ${state.bodyType}",
                            style: TextStyle(
                              fontSize: getResponsiveValue(
                                context,
                                18,
                              ),
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: " and your BMI is",
                            style: TextStyle(
                              fontSize: getResponsiveValue(
                                context,
                                16,
                              ),
                              fontWeight: FontWeight.w400,
                              color: Colors.black87,
                            ),
                          ),
                          TextSpan(
                            text: " ${state.bmiValue.toStringAsFixed(1)}",
                            style: TextStyle(
                              fontSize: getResponsiveValue(
                                context,
                                18,
                              ),
                              fontWeight: FontWeight.w600,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
              SizedBox(
                height: getResponsiveValue(context, 15),
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<BmiCubit>().calculateBmi(
                        age: _ageController.text,
                        height: _heightController.text,
                        weight: _weightController.text);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      colorSwatch["filledBtnColor"],
                    ),
                  ),
                  child: const Text(
                    "Calculate",
                  )),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _ageController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }
}
