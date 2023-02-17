import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organizing_web/app/view/recorde_expense/recorde_expense_controller.dart';
import 'package:organizing_web/app/view/recorde_expense/widgets/dropdonw.dart';

class BodyRecordeExpense extends GetView<RecordeExpenseController> {
  const BodyRecordeExpense({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: GetBuilder<RecordeExpenseController>(
          builder: (control) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Adicionar Despesa',
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  TextField(
                    controller: control.titleController,
                    decoration: const InputDecoration(
                      hintText: 'Titulo',
                    ),
                  ),
                  TextField(
                    controller: control.valueController,
                    decoration: const InputDecoration(
                      hintText: 'Valor',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Dropdonw(
                      onChanged: control.changeStatus,
                      dropOpcoes: control.dropStatus,
                      title: 'Status',
                      selected: control.selectedItem,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      control.sendData();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'Enviar',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     control.detailsExpense();
                  //   },
                  //   child: const Padding(
                  //     padding: EdgeInsets.all(15),
                  //     child: Text(
                  //       'Ver Despesas',
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const Center(
                    child: Text(
                      'Despesas',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  (control.listExpense == 0)
                      ? const Text(
                          'Nenhum Dado registrado',
                          style: TextStyle(
                            color: Colors.orange,
                          ),
                          textAlign: TextAlign.center,
                        )
                      : DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.purple.shade100,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  const Text(
                                    'Titulo',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  for (String list in control.listExpense)
                                    Text(list)
                                ],
                              ),
                              // const Divider(),
                              Column(
                                children: [
                                  const Text(
                                    'Valor',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  for (String listValue in control.listValue)
                                    Text(listValue)
                                ],
                              ),
                              Column(
                                children: [
                                  const Text(
                                    'Status',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  for (String listStatus in control.listStatus)
                                    Text(listStatus)
                                ],
                              ),
                            ],
                          ),
                        ),
                ],

                // : DataTable(
                //     columns: const [
                //       DataColumn(label: Text('Titulo')),
                //       DataColumn(label: Text('Valor')),
                //       DataColumn(label: Text('Status')),
                //     ],
                //     rows: [
                //       DataRow(
                //         cells: [
                //           DataCell(
                //             Text(control.firestore
                //                 .collection('Despesas')
                //                 .get()),
                //           ),
                //           DataCell(
                //             Text(control.firestore
                //                 .collection('Despesas')
                //                 .get()
                //                 .toString()),
                //           ),
                //           DataCell(
                //             Text(control.firestore
                //                 .collection('Despesas')
                //                 .get()
                //                 .toString()),
                //           ),
                //         ],
                //       ),
                //     ],
                //     // children: [
                //     //   for (String list in control.listExpense) Text(list),
                //     //   Row(
                //     //     children: const [],
                //     //   )
                //     // ],
                //   )
              ),
            );
          },
        ),
      ),
    );
  }
}
