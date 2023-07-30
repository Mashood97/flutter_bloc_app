part of 'expense_cubit.dart';

@immutable
abstract class ExpenseState {
  const ExpenseState();
}

class ExpenseInitialState extends ExpenseState {
  const ExpenseInitialState();
}

class ExpenseLoadingState extends ExpenseState {
  const ExpenseLoadingState();
}

class ExpenseSuccessState extends ExpenseState {
  final List<ExpenseModel> expenseModelList;
  const ExpenseSuccessState({
    required this.expenseModelList,
  });
}

class ExpenseErrorState extends ExpenseState {
  final String errorMessage;
  const ExpenseErrorState({
    required this.errorMessage,
  });
}
