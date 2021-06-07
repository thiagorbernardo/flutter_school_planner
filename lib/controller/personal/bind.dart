import 'package:get/get.dart';
import 'package:school_planner/controller/personal/controller.dart';
import 'package:school_planner/controller/personal/input.dart';

class SchoolPlannerBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SchoolController>(() => SchoolController());
    Get.lazyPut<InputController>(() => InputController());
  }
}
