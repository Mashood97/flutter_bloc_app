import 'package:bloc/bloc.dart';
import 'package:bloc_article_app/src/expense/model/expense_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_state.dart';

class ExpenseCubit extends Cubit<ExpenseState> {
  ExpenseCubit() : super(const ExpenseInitialState());

  void insertExpenseIntoDb() async {
    try {} catch (e) {}
  }
}
