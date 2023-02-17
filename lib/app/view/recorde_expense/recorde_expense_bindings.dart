import 'package:get/get.dart';
import 'package:organizing_web/app/view/recorde_expense/recorde_expense_controller.dart';

class RecordeExpenseBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(RecordeExpenseController());
  }
}
