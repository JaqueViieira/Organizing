import 'package:flutter/material.dart';
import 'package:organizing_web/app/view/recorde_expense/widgets/body_recorde_expense.dart';

class RecordeExpensePage extends StatelessWidget {
  const RecordeExpensePage({Key? key}) : super(key: key);
  static const route = '/recorde_expense';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas meu Casamento'),
        centerTitle: true,
      ),
      body: const BodyRecordeExpense(),
    );
  }
}
