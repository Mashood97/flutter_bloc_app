part of 'bmi_cubit.dart';

@immutable
abstract class BmiState {
  const BmiState();
}

class BmiInititalState extends BmiState {
  const BmiInititalState();
}

class BmiLoadingState extends BmiState {
  const BmiLoadingState();
}

class BmiLoadedState extends BmiState {
  final String bodyType;
  final double bmiValue;
  const BmiLoadedState({
    required this.bmiValue,
    required this.bodyType,
  });
}

class BmiErrorState extends BmiState {
  final String errorMsg;

  const BmiErrorState({
    required this.errorMsg,
  });
}
