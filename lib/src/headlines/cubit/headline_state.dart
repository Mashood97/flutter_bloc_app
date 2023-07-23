part of 'headline_cubit.dart';

@immutable
abstract class HeadlineState {
  const HeadlineState();
}

class HeadlineInitial extends HeadlineState {
  const HeadlineInitial();
}

class HeadlineLoading extends HeadlineState {
  const HeadlineLoading();
}

class HeadlineLoaded extends HeadlineState {
  final List<HeadlineModel> headline;
  const HeadlineLoaded(this.headline);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HeadlineLoaded && other.headline == headline;
  }

  @override
  int get hashCode => headline.hashCode;
}

class HeadlineError extends HeadlineState {
  final String message;

  const HeadlineError(this.message);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HeadlineError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
