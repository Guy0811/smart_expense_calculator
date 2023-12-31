import 'package:flutter/material.dart';

import 'package:smart_expense_calculator/models/expense.dart';
import 'package:smart_expense_calculator/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[
            index]), // key is used to uniquely identify widgets for dismissal
        background: Container(
            color: Theme.of(context).colorScheme.error.withOpacity(0.65),
            margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal,
            )
            // const EdgeInsets.symmetric(horizontal: 16,),
            ),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
