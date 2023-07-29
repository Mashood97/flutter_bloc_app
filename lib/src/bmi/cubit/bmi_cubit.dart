import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bmi_state.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit() : super(const BmiInititalState());

  void calculateBmi({
    required String age,
    required String height,
    required String weight,
  }) {
    try {
      emit(const BmiLoadingState());
      Future.delayed(const Duration(seconds: 5), () {
        if ((age.isNotEmpty) && (weight.isNotEmpty) && (height.isNotEmpty)) {
          int userAge = int.parse(age);
          double userHeight = double.parse(height);
          var inches = userHeight * 12;
          double userWeight = double.parse(weight);
          String bodyTypeState = "";
          double result = 0.0;

          /*Underweight: BMI is less than 18.5
Normal weight: BMI is 18.5 to 24.9
Overweight: BMI is 25 to 29.9
Obese: BMI is 30 or more*/

          if (userAge > 0 && (userWeight > 0) && (inches > 0)) {
            result = userWeight / (inches * inches) * 703;
            if (result < 18.5) {
              bodyTypeState = "Under Weight";
            } else if (result >= 18.5 && result < 24.9) {
              bodyTypeState = "Normal Weight";
            } else if (result >= 25 && result < 29.9) {
              bodyTypeState = "Over Weight";
            } else if (result >= 30) {
              bodyTypeState = "Obese";
            }
          } else {
            result = 0.0;
            emit(const BmiErrorState(
              errorMsg: "Something went wrong while calculating BMI",
            ));
          }
          emit(
            BmiLoadedState(
              bmiValue: result,
              bodyType: bodyTypeState,
            ),
          );
        } else {
          emit(const BmiErrorState(
            errorMsg:
                "Something went wrong while calculating BMI, Please check if all fields are correctly entered.",
          ));
        }
      });
    } catch (e) {
      emit(const BmiErrorState(
        errorMsg: "Something went wrong while calculating BMI",
      ));
    }
  }
}
