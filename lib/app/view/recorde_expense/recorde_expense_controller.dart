import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class RecordeExpenseController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final List<String> dropStatus = ['Pendente', 'Paga'];
  List<String> listExpense = [];

  List<String> listValue = [];
  List<String> listStatus = [];

  TextEditingController titleController = TextEditingController();
  TextEditingController valueController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    detailsExpense();
    firestore.collection('Despesas').snapshots().listen((query) {
      listExpense = [];
      for (var doc in query.docs) {
        update();
        listExpense.add(
          doc.get('Title'),
        );
      }
    });
    update();
    firestore.collection('Despesas').snapshots().listen((queryValue) {
      listValue = [];
      for (var document in queryValue.docs) {
        update();
        listValue.add(
          document.get('Value'),
        );
      }
    });
    update();
    firestore.collection('Despesas').snapshots().listen((query) {
      listStatus = [];
      for (var documento in query.docs) {
        update();
        listStatus.add(
          documento.get('Status'),
        );
      }
    });
    update();
  }

  String? selectedItem = 'Pendente';

  void changeStatus(String? value) {
    selectedItem = value;
    update();
  }

  void sendData() {
    String id = const Uuid().v1();
    firestore.collection('Despesas').doc(id).set({
      'Title': titleController.text,
      'Value': valueController.text,
      'Status': selectedItem,
    });
    titleController.text = '';
    valueController.text = '';

    Get.showSnackbar(
      const GetSnackBar(
        message: "Salvo com Sucesso",
      ),
    );
  }

  void detailsExpense() async {
    QuerySnapshot query = await firestore.collection('Despesas').get();
    listExpense = [];
    listValue = [];
    listStatus = [];
    for (var doc in query.docs) {
      String title = doc.get('Title');
      String value = doc.get('Value');
      String status = doc.get('Status');
      update();
      listExpense.add(title);
      listValue.add(value);
      listStatus.add(status);
    }
  }

  // String? validTextFormTitle(String? value) {
  //   return simpleValidate(value);
  // }

  // String? validTextFormValue(String? value) {
  //   return simpleValidate(value);
  // }

  // bool isFormValid() {
  //   if (validTextFormTitle(titleController.text) == null &&
  //       validTextFormValue(valueController.text) == null) {
  //     return true;
  //   }
  //   return false;
  // }
}
