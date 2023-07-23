import 'package:flutter_bloc/flutter_bloc.dart';

enum ToggleState { on, off }

class ToggleCubit extends Cubit<ToggleState> {
  ToggleCubit() : super(ToggleState.off);

  void toggle() {
    if (state == ToggleState.on) {
      emit(ToggleState.off);
    } else {
      emit(ToggleState.on);
    }
  }
}
